import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/audio_widget.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/chat_button_widget.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/chat_loading_widget.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';

class ChatWidget extends StatelessWidget {
  final bool received;
  final dynamic text;
  final bool loading;
  final bool shouldAnimate;
  final bool shouldAudio;
  final bool shouldButton;

  const ChatWidget(
      {super.key,
      required this.received,
      required this.text,
      required this.loading,
      this.shouldAnimate = false,
      required this.shouldAudio,
      this.shouldButton = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          (received) // CONDIÇÃO QUE VERIFICA SE A MENSAGEM ESTÁ SENDO RECEBIDA OU ENVIADA
              ? Alignment.topLeft
              : Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 8,
          left: (!received) ? 40 : 0,
          right: (received) ? 40 : 0,
        ),
        child: (loading)
            ? const ChatLoadingWidget()
                .animate()
                .fade(begin: 0, end: 1, duration: 500.milliseconds)
            : (shouldAudio)
                ? const AudioWidget()
                    .animate()
                    .fade(begin: 0, end: 1, duration: 500.milliseconds)
                : (shouldButton)
                    ? const ChatButtonWidget()
                        .animate()
                        .fade(begin: 0, end: 1, duration: 500.milliseconds)
                    : BoxCard(
                        color: (received) ? null : Colors.indigoAccent,
                        widget: (shouldAnimate)
                            ? DefaultTextStyle(
                                style: TextStyle(
                                    color: (received)
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                                child: AnimatedTextKit(
                                    isRepeatingAnimation: false,
                                    repeatForever: false,
                                    displayFullTextOnTap: true,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        text,
                                      ),
                                    ]),
                              )
                            : Text(
                                text,
                                textWidthBasis: TextWidthBasis.parent,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color:
                                      (received) ? Colors.black : Colors.white,
                                ),
                              ),
                      ),
      ),
    );
  }
}
