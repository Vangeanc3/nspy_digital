import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/themes/theme_colors.dart';
import 'package:nspy_digital/src/shared/utils/aumatic_message.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:provider/provider.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  double widthContainer = 0;
  bool visivel = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      automaticMessage(context);
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          widthContainer = 10;
          visivel = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<MensagensRepository>(
        builder: (context, list, child) {
          return ListView.builder(
            itemCount: list.messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              return Align(
                alignment: (list.messages[index][
                        "received"]) // CONDIÇÃO QUE VERIFICA SE A MENSAGEM ESTÁ SENDO RECEBIDA OU ENVIADA
                    ? Alignment.topLeft
                    : Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 8,
                    left: (!list.messages[index]["received"]) ? 50 : 0,
                    right: (list.messages[index]["received"]) ? 50 : 0,
                  ),
                  child: (list.messages[index]["loading"])
                      ? list.messages[index]["text"]
                      : BoxCard(
                          color: (list.messages[index]["received"])
                              ? null
                              : ThemeColors.msgSendColor,
                          widget: AnimatedTextKit(
                            isRepeatingAnimation: false,
                            repeatForever: false,
                            displayFullTextOnTap: true,
                            totalRepeatCount: 1,
                            animatedTexts: [
                              TyperAnimatedText(
                                list.messages[index]["text"],
                              )
                            ],
                            // style: const TextStyle(fontSize: 16),
                          ),
                        ),
                ),
              );
            },
          );
        },
      )),
    );
  }
}
