import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/chat_bot/chat_bot_screen.dart';
import 'package:nspy_digital/src/pages/home/home_screen.dart';
import 'package:nspy_digital/src/pages/pre_sales/pre_sales_screen.dart';
import 'package:nspy_digital/src/pages/register/register_screen.dart';
import 'package:nspy_digital/src/pages/sales/sales_screen.dart';
import 'package:nspy_digital/src/pages/web_sales/web_sales_page.dart';
import 'package:nspy_digital/src/shared/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  final int isLogged;
  const MyApp({super.key, required this.isLogged});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSPY Digital',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.myTheme,
      initialRoute: "/pre_sales",
      routes: {
        "/": (context) =>
            (isLogged == 1) ? const HomeScreen() : const ChatBotScreen(),
        "/chat": (context) => const ChatBotScreen(),
        "/register": (context) => const RegisterScreen(),
        "/home": (context) => const HomeScreen(),
        "/sales": (context) => const SalesScreen(),
        "/web": (context) => const WebSalesPage(),
        "/pre_sales": (context) => const PreSalesScreen()
      },
    );
  }
}
