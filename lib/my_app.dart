import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/chat_bot/chat_bot_screen.dart';
import 'package:nspy_digital/src/pages/home/home_screen.dart';
import 'package:nspy_digital/src/pages/pre_sales/pre_sales_screen.dart';
import 'package:nspy_digital/src/pages/privacy_policy/privacy_policy_screen.dart';
import 'package:nspy_digital/src/pages/register/register_screen.dart';
import 'package:nspy_digital/src/pages/sales/sales_screen.dart';
import 'package:nspy_digital/src/pages/web_sales/web_sales_page.dart';
import 'package:nspy_digital/src/pages/welcome/welcome_screen.dart';
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
      initialRoute: "/welcome",
      routes: {
        "/welcome": (context) => const WelcomeScreen(),
        "/home": (context) =>  const HomeScreen(),
        "/privacy_policy":(context) => const PrivacyPolicyScreen(),
        "/decision": (context) =>
            (isLogged == 1) ? const HomeScreen() : const ChatBotScreen(),
        "/register": (context) => const RegisterScreen(),
        "/sales": (context) => const SalesScreen(),
        "/web": (context) => const WebSalesPage(),
        "/pre_sales": (context) => const PreSalesScreen()
      },
    );
  }
}
