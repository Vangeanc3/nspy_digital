
  import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:provider/provider.dart';

Future<dynamic> automaticMessage(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      Provider.of<MensagensRepository>(context, listen: false).removeLoading();

      Future.delayed(const Duration(milliseconds: 10), () {
        Provider.of<MensagensRepository>(context, listen: false).addMessage({
          "text": "Seja Bem vindo ao aplicativo Nspy Digital.",
          "received": true,
          "loading": false
        });

        Future.delayed(
          const Duration(milliseconds: 500),
          () {
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
            Future.delayed(const Duration(seconds: 3), () {
              Provider.of<MensagensRepository>(context, listen: false)
                  .removeLoading();

              Future.delayed(
                const Duration(milliseconds: 10),
                () {
                  Provider.of<MensagensRepository>(context, listen: false)
                      .addMessage({
                    "text":
                        "Meu nome é Carol Vasconselos, vai ser um prazer enorme te ajudar!",
                    "received": true,
                    "loading": false
                  });

                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      Provider.of<MensagensRepository>(context, listen: false)
                          .addMessage(
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
                      Future.delayed(
                        const Duration(seconds: 3),
                        () {
                          Provider.of<MensagensRepository>(context,
                                  listen: false)
                              .removeLoading();

                          Future.delayed(
                            const Duration(milliseconds: 10),
                            () {
                              Provider.of<MensagensRepository>(context,
                                      listen: false)
                                  .addMessage({
                                "text":
                                    "Você poderia me dizer qual o seu nome?",
                                "received": true,
                                "loading": false
                              });
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            });
          },
        );
      });
    });
  }