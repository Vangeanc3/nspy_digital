import 'package:flutter/material.dart';
import 'package:nspy_digital/pages/chat_bot/chat_bot_screen.dart';
import 'package:nspy_digital/pages/register/register_screen.dart';
import 'package:nspy_digital/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.myTheme,
      initialRoute: "/chat_bot",
      routes: {
        "/chat_bot": (context) => const ChatBotScreen(),
        "/register": (context) => const RegisterScreen(),
      },
    );
  }
}
