import 'package:flutter/material.dart';
import 'package:nspy_digital/src/repositories/mensagens_repository.dart';
import 'package:provider/provider.dart';

removeLoadingAndAddMessage(BuildContext context, String message) async {
  Provider.of<MensagensRepository>(context, listen: false).removeLoading();

  //REMOVE O LOADING E ADD A MSG
   await Future.delayed(const Duration(milliseconds: 10), () {
    Provider.of<MensagensRepository>(context, listen: false)
        .addMessage({"text": message, "received": true, "loading": false});
  });
}