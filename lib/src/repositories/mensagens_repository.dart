import 'package:flutter/material.dart';

class MensagensRepository extends ChangeNotifier {
  List<Map<String, dynamic>> messages;

  MensagensRepository({required this.messages});

  void addMessage(Map<String, dynamic> mensagem) {
    messages.add(mensagem);
    notifyListeners();
  }

  int getId() {
    final id = messages.last["mensagens_id"];
    return id;
  }

  int getLenght() {
    return messages.length;
  }

  void replaceMessage(List<Map<String, dynamic>> messages) {
    this.messages.clear();
    this.messages.addAll(messages);
    notifyListeners();
  }

  void removeLoading() {
    messages.removeWhere((elemento) => elemento["loading"] == true);
    notifyListeners();
  }

  void cleanMessages() {
    messages.clear();
    notifyListeners();
  }
}
