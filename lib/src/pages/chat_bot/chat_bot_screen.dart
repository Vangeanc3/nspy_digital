import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/chat_bot/widgets/body_messages.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: BodyMessages(),
            ),
            Container(
              color: Colors.green,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
