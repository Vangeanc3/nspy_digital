// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/utils/remove_loading_and_add_message.dart';
import 'package:provider/provider.dart';

sendMessageName(
    BuildContext context, String message, Function(bool) callBack) async {
  final repository = Provider.of<MensagensRepository>(context, listen: false);
  repository.addMessage({
    "text": message,
    "received": false,
    "loading": false,
    "audio": false,
    "button": false
  });

  await Future.delayed(
    const Duration(microseconds: 50),
    () async {
      repository.addMessage(
        {
          "text": "",
          "received": true,
          "loading": true,
          "audio": false,
          "button": false
        },
      );

      await Future.delayed(
        const Duration(milliseconds: 500),
        () async {
          await removeLoadingAndAddMessage(
              context, "$message você já sabe como funciona o aplicativo?");

          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title:
                      Text('$message você já sabe como funciona o aplicativo?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async {
                        repository.addMessage({
                          "text": "SIM, JÁ SEI COMO FUNCIONA!",
                          "received": false,
                          "loading": false,
                          "audio": false,
                          "button": false
                        });
                        repository.addMessage(
                          {
                            "text": "",
                            "received": true,
                            "loading": true,
                            "audio": false,
                            "button": false
                          },
                        );
                        await removeLoadingAndAddMessage(context,
                            "Para iniciarmos você poderia me informar quais comportamentos estranhos você notou?");
                        Navigator.of(context).pop();
                        callBack(true);
                      },
                      child: const Text('SIM, JÁ SEI COMO FUNCIONA!'),
                    ),
                    TextButton(
                      onPressed: () async {
                        // Ação a ser executada quando o usuário pressionar "Confirmar"
                        repository.addMessage({
                          "text": "NÃO, ME EXPLICA POR FAVOR!",
                          "received": false,
                          "loading": false,
                          "audio": false,
                          "button": false
                        });
                        Navigator.of(context).pop(); // Fecha o modal
                        repository.addMessage(
                          {
                            "text": "audio",
                            "received": true,
                            "loading": false,
                            "audio": true,
                            "button": false
                          },
                        );

                        repository.addMessage(
                          {
                            "text": "",
                            "received": true,
                            "loading": true,
                            "audio": false,
                            "button": false
                          },
                        );
                        await removeLoadingAndAddMessage(context,
                            "Para iniciarmos você poderia me informar quais comportamentos estranhos você notou?");
                        callBack(true);
                        // Coloque aqui a lógica para a ação de confirmação
                      },
                      child: const Text('NÃO, ME EXPLICA POR FAVOR!'),
                    ),
                  ],
                );
              });
        },
      );
    },
  );
}
