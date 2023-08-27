import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/utils/remove_loading_and_add_message.dart';
import 'package:provider/provider.dart';

sendMessage(String mensagem, BuildContext context) async {
  final repository = Provider.of<MensagensRepository>(context, listen: false);

  // MENSAGEM ENVIADA PELO USUÁRIO
  repository.addMessage({
    "text": mensagem,
    "received": false,
    "loading": false,
    "audio": false,
    "button": false
  });

  // WIDGET DE LOADING ENQUANTO A MENSAGEM CHEGA
  repository.addMessage({
    "text": "",
    "received": true,
    "loading": true,
    "audio": false,
    "button": false
  });

  await Future.delayed(
    const Duration(milliseconds: 500),
    () async {
      await removeLoadingAndAddMessage(
          context, "humm... realmente são indicios de uma possível traição.");

      repository.addMessage({
        "text": "",
        "received": true,
        "loading": true,
        "audio": false,
        "button": false
      });

      await Future.delayed(
        const Duration(milliseconds: 500),
        () async {
          await removeLoadingAndAddMessage(context,
              "Para ir ao menu do aplicativo e começar o monitoramento, clique no botão aqui abaixo");
          repository.addMessage({
            "text": "",
            "received": false,
            "loading": false,
            "audio": false,
            "button": true
          });
        },
      );
    },
  );
}
