import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:provider/provider.dart';

Future<dynamic> automaticMessage(BuildContext context) async {
  // Espera 3s para remover o loading
  Future.delayed(
    const Duration(seconds: 3),
    () {
      removeLoadingAndAddMessage(
          context, "Seja Bem vindo ao aplicativo Nspy Digital.");

      // DEPOIS ADD O LOADING
      Future.delayed(const Duration(milliseconds: 500), () {
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
        Future.delayed(
          const Duration(seconds: 3),
          () {
            removeLoadingAndAddMessage(context,
                "Meu nome é Carol Vasconselos, vai ser um prazer enorme te ajudar!");

            Future.delayed(
              const Duration(milliseconds: 500),
              () {
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
                Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    removeLoadingAndAddMessage(
                        context, "Você poderia me dizer qual o seu nome?");
                  },
                );
              },
            );
          },
        );
      });
    },
  );
}

removeLoadingAndAddMessage(BuildContext context, String message) {
  Provider.of<MensagensRepository>(context, listen: false).removeLoading();

  //REMOVE O LOADING E ADD A MSG
  Future.delayed(const Duration(milliseconds: 10), () {
    Provider.of<MensagensRepository>(context, listen: false)
        .addMessage({"text": message, "received": true, "loading": false});
  });
}
