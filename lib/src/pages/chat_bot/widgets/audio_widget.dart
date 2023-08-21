import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({super.key});

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  late AudioPlayer audioPlayer;

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          audioPlayer.positionStream,
          audioPlayer.bufferedPositionStream,
          audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  void initState() {
    audioPlayer = AudioPlayer()..setAsset('assets/audio/audio.mp3');

    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;

            if (!(playing ?? false)) {
              return IconButton(
                  onPressed: () {}, icon: const Icon(Icons.play_arrow_rounded));
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                  onPressed: audioPlayer.pause,
                  icon: const Icon(Icons.pause_rounded));
            }
            return const Icon(Icons.play_arrow_rounded);
          },
        ),
        StreamBuilder<PositionData>(
          stream: positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            return Expanded(
              child: ProgressBar(
                progress: positionData?.positon ?? Duration.zero,
                buffered: positionData?.bufferedPosition ?? Duration.zero,
                total: positionData?.duration ?? Duration.zero,
                onSeek: audioPlayer.seek,
                barHeight: 8,
                baseBarColor: Colors.grey[600],
                bufferedBarColor: Colors.grey,
                progressBarColor: Colors.red,
                thumbColor: Colors.red,
                timeLabelTextStyle: const TextStyle(color: Colors.black),
              ),
            );
          },
        )
      ],
    );
  }
}

class PositionData {
  const PositionData(this.bufferedPosition, this.positon, this.duration);

  final Duration positon;
  final Duration bufferedPosition;
  final Duration duration;
}
