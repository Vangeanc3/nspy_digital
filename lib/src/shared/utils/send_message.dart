import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:nspy_digital/src/shared/widgets/box_card.dart';
import 'package:provider/provider.dart';

sendMessage(String mensagem, BuildContext context, int? id) async {
  // MENSAGEM ENVIADA PELO USUÁRIO
  Provider.of<MensagensRepository>(context, listen: false)
      .addMessage({"texto": mensagem, "receveid": false, "loading": false});

  // WIDGET DE LOADING ENQUANTO A MENSAGEM CHEGA
  Provider.of<MensagensRepository>(context, listen: false).addMessage({
    "texto": BoxCard(
        widget: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 70),
      child: const SpinKitThreeBounce(
        color: Colors.white,
        size: 10,
      ),
    )),
    "receveid": true,
    "loading": true
  });
}
