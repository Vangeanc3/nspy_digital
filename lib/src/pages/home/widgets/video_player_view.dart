import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    _videoController = VideoPlayerController.asset("assets/app/home_play.mp4")
      ..initialize().then((_) {
        setState(() {});
      });

    _chewieController = ChewieController(
        videoPlayerController: _videoController, allowFullScreen: false);
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _videoController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: Chewie(controller: _chewieController),
            )
          : const CircularProgressIndicator(), // Mostra um indicador de carregamento enquanto o vídeo está sendo inicializado.
    );
  }
}
