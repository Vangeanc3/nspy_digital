import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/utils/remove_loading_and_add_message.dart';
import 'package:provider/provider.dart';

Future<bool> automaticMessage(BuildContext context) async {
  final repository = Provider.of<MensagensRepository>(context, listen: false);

  // Espera 3s para remover o loading
  await Future.delayed(
    const Duration(seconds: 1),
    () async {
      removeLoadingAndAddMessage(
          context, "Seja Bem vindo ao aplicativo Nspy Digital.");

      // DEPOIS ADD O LOADING
      await Future.delayed(const Duration(milliseconds: 1800), () async {
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
          const Duration(seconds: 1),
          () async {
            removeLoadingAndAddMessage(context,
                "Meu nome é Carol Vasconselos, vai ser um prazer enorme te ajudar!");

            await Future.delayed(
              const Duration(milliseconds: 3500),
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
                  const Duration(seconds: 3),
                  () async {
                    removeLoadingAndAddMessage(
                        context, "Você poderia me dizer qual o seu nome?");
                    await Future.delayed(const Duration(seconds: 1));
                  },
                );
              },
            );
          },
        );
      });
    },
  );
  return true;
}
