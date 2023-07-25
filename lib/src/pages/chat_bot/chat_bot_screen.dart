import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/body_messages.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/input_message.dart';
import 'package:nspy_digital/src/shared/themes/theme_colors.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
                child: BodyMessages(),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 70, maxHeight: 150),
              child: Container(
                decoration: const BoxDecoration(color: ThemeColors.temaWhats2),
                padding: const EdgeInsets.only(bottom: 5, left: 5, top: 5),
                child: const InputMessage(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
