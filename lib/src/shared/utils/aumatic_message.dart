import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/utils/remove_loading_and_add_message.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:provider/provider.dart';

Future<bool> automaticMessage(BuildContext context) async {
  // Espera 3s para remover o loading
  await Future.delayed(
    const Duration(seconds: 3),
    () async {
      removeLoadingAndAddMessage(
          context, "Seja Bem vindo ao aplicativo Nspy Digital.");

      // DEPOIS ADD O LOADING
     await Future.delayed(const Duration(milliseconds: 2500), () async {
        Provider.of<MensagensRepository>(context, listen: false).addMessage(
          {
            "text": BoxCard(
                widget: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 70),
                    child: const SpinKitThreeBounce(
                      color: Colors.black,
                      size: 10,
                    ))),
            "received": true,
            "loading": true
          },
        );
        await Future.delayed(
          const Duration(seconds: 3),
          () async {
            removeLoadingAndAddMessage(context,
                "Meu nome é Carol Vasconselos, vai ser um prazer enorme te ajudar!");

            await Future.delayed(
              const Duration(milliseconds: 3500),
              () async {
                Provider.of<MensagensRepository>(context, listen: false)
                    .addMessage(
                  {
                    "text": BoxCard(
                        widget: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 70),
                            child: const SpinKitThreeBounce(
                              color: Colors.black,
                              size: 10,
                            ))),
                    "received": true,
                    "loading": true
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


