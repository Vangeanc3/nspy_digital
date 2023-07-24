import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/themes/theme_colors.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:provider/provider.dart';

class BodyMessages extends StatelessWidget {
  const BodyMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MensagensRepository>(
      builder: (context, list, child) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Align(
                  alignment: (list.mensagens[index][
                          "receveid"]) // CONDIÇÃO QUE VERIFICA SE A MENSAGEM ESTÁ SENDO RECEBIDA OU ENVIADA
                      ? Alignment.topLeft
                      : Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 8,
                      left: (!list.mensagens[index]["receveid"]) ? 50 : 0,
                      right: (list.mensagens[index]["receveid"]) ? 50 : 0,
                    ),
                    child: (list.mensagens[index]["loading"])
                        ? list.mensagens[index]["texto"]
                        : BoxCard(
                            color: (list.mensagens[index]["receveid"])
                                ? null
                                : ThemeColors.msgSendColor,
                            widget: Text(list.mensagens[index]["texto"]),
                          ),
                  ),
                );
              }, childCount: list.mensagens.length),
            ),
          ],
        );
      },
    );
  }
  }
