import 'package:flutter/material.dart';
import 'package:nspy_digital/my_app.dart';
import 'package:nspy_digital/src/database/nspy_dao.dart';
import 'package:provider/provider.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var logged = await NSPYDao().retornaLogado();
  print("Token: ${logged["logado"]}");

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => MensagensRepository(messages: [
                  {
                    "text": "",
                    "received": true,
                    "loading": true,
                    "audio": false,
                    "button": false
                  },
                ])),
      ],
      child: MyApp(
        isLogged: logged["logado"],
      )));
}
