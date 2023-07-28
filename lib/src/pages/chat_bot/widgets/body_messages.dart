import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/themes/theme_colors.dart';
import 'package:nspy_digital/src/shared/utils/aumatic_message.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:provider/provider.dart';

class BodyMessages extends StatefulWidget {
  const BodyMessages({super.key});

  @override
  State<BodyMessages> createState() => _BodyMessagesState();
}

class _BodyMessagesState extends State<BodyMessages>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      automaticMessage(context);
    });

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _controller.forward(); // Inicia a animação automaticamente
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MensagensRepository>(
      builder: (context, list, child) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
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
                        : AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: _controller.value * 200,
                            child: BoxCard(
                              color: (list.messages[index]["received"])
                                  ? null
                                  : ThemeColors.msgSendColor,
                              widget: Text(
                                list.messages[index]["text"],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                  ),
                );
              }, childCount: list.messages.length),
            ),
          ],
        );
      },
    );
  }
}
