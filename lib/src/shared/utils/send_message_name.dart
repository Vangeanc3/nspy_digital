// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/utils/remove_loading_and_add_message.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:provider/provider.dart';

sendMessageName(BuildContext context, String message) async {
  Provider.of<MensagensRepository>(context, listen: false)
      .addMessage({"text": message, "received": false, "loading": false});

  await Future.delayed(
    const Duration(microseconds: 500),
    () async {
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
        const Duration(seconds: 1),
        () async {
          await removeLoadingAndAddMessage(
              context, "$message você já sabe como funciona o aplicativo?");

          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title:
                      Text('$message Você já sabe como funciona o aplicativo?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Provider.of<MensagensRepository>(context, listen: false)
                            .addMessage({
                          "text": "SIM, JÁ SEI COMO FUNCIONA!",
                          "received": false,
                          "loading": false
                        });
                        Provider.of<MensagensRepository>(context,listen: false).addMessage(
                          {
                            "text": BoxCard(
                                widget: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 70),
                                    child: const SpinKitThreeBounce(
                                      color: Colors.black,
                                      size: 10,
                                    ))),
                            "received": true,
                            "loading": true
                          },
                        );
                        Future.delayed(const Duration(seconds: 1), () async {
                          removeLoadingAndAddMessage(context, "Para iniciarmos você poderia me informar quais comportamentos estranhos você notou?");
                        },);
                        Navigator.of(context).pop();
                      },
                      child: const Text('SIM, JÁ SEI COMO FUNCIONA!'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Ação a ser executada quando o usuário pressionar "Confirmar"
                        Provider.of<MensagensRepository>(context, listen: false)
                            .addMessage({
                          "text": "NÃO, ME EXPLICA POR FAVOR!",
                          "received": false,
                          "loading": false
                        });
                        Navigator.of(context).pop(); // Fecha o modal
                        Provider.of<MensagensRepository>(context).addMessage(
                          {
                            "text": BoxCard(
                                widget: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 70),
                                    child: const SpinKitThreeBounce(
                                      color: Colors.black,
                                      size: 10,
                                    ))),
                            "received": true,
                            "loading": true
                          },
                        );
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
