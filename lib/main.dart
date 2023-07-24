import 'package:flutter/material.dart';
import 'package:nspy_digital/my_app.dart';
import 'package:provider/provider.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => MensagensRepository(messages: [])),
  ], child: const MyApp()));
}
