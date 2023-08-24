import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nspy_digital/my_app.dart';
import 'package:provider/provider.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';

import 'src/shared/widgets/box_card.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => MensagensRepository(messages: [
              {
                "text": BoxCard(
                    widget: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 70),
                        child: const SpinKitThreeBounce(
                          color: Colors.black,
                          size: 10,
                        ))),
                "received": true,
                "loading": true,
                "audio": false,
                "button": false
              },
            ])),
  ], child: const MyApp()));
}
