import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/audio_widget.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/chat_button_widget.dart';
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
            ? text
            : (shouldAudio)
                ? const AudioWidget()
                : (shouldButton)
                    ? const ChatButtonWidget()
                    : BoxCard(
                        color: (received) ? null : Colors.green[300],
                        widget: (shouldAnimate)
                            ? DefaultTextStyle(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                                child: AnimatedTextKit(
                                    isRepeatingAnimation: false,
                                    repeatForever: false,
                                    displayFullTextOnTap: true,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        text.trim(),
                                      ),
                                    ]),
                              )
                            : Text(
                                text,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                      ),
      ),
    );
  }
}
