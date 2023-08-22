import 'package:flutter/material.dart';
import 'package:nspy_digital/src/pages/chat_bot/chat_bot_screen.dart';
import 'package:nspy_digital/src/pages/home/home_screen.dart';
import 'package:nspy_digital/src/pages/register/register_screen.dart';
import 'package:nspy_digital/src/pages/sales_page/sales_screen.dart';
import 'package:nspy_digital/src/pages/teste.dart';
import 'package:nspy_digital/src/pages/web_sales/web_sales_page.dart';
import 'package:nspy_digital/src/shared/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSPY Digital',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.myTheme,
      initialRoute: "/home",
      routes: {
        "/chat": (context) => const ChatBotScreen(),
        "/register": (context) => const RegisterScreen(),
        "/home": (context) => const HomeScreen(),
        "/sales": (context) => const SalesScreen(),
        "/web": (context) => const WebSalesPage(),
        "/teste": (context) => const Teste(),
      },
    );
  }
}
