import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:provider/provider.dart';

removeLoadingAndAddMessage(BuildContext context, String message) async {
  final repository = Provider.of<MensagensRepository>(context, listen: false);
  repository.removeLoading();

  //REMOVE O LOADING E ADD A MSG
  await Future.delayed(const Duration(milliseconds: 10), () {
    repository.addMessage({
      "text": message,
      "received": true,
      "loading": false,
      "audio": false,
      "button": false
    });
  });
}
