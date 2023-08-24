// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/utils/remove_loading_and_add_message.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
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
    "text": BoxCard(
        widget: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 70),
      child: const SpinKitThreeBounce(
        color: Colors.white,
        size: 10,
      ),
    )),
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
        "text": BoxCard(
            widget: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 70),
          child: const SpinKitThreeBounce(
            color: Colors.white,
            size: 10,
          ),
        )),
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
            "text": BoxCard(
                widget: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 70),
              child: const SpinKitThreeBounce(
                color: Colors.white,
                size: 10,
              ),
            )),
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
