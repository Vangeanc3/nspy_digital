import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nspy_digital/src/shared/themes/theme_colors.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';

class ChatWidget extends StatelessWidget {
  final bool received;
  final dynamic text;
  final bool loading;
  final bool shouldAnimate;

  const ChatWidget(
      {super.key,
      required this.received,
      required this.text,
      required this.loading,
      this.shouldAnimate = false});

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
            : BoxCard(
                color: (received) ? null : Colors.green[300],
                widget: (shouldAnimate)
                    ? DefaultTextStyle(
                        style: const TextStyle(
                          color: Colors.black,
                            fontWeight: FontWeight.w700, fontSize: 16),
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
