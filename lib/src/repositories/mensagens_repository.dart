import 'package:flutter/material.dart';

class MensagensRepository extends ChangeNotifier {
  List<Map<String, dynamic>> messages;
  List<Map<String, dynamic>> get getList{
    return messages;
  }

  MensagensRepository({required this.messages});

  void addMessage(Map<String, dynamic> message) {
    messages.add(message);
    notifyListeners();
  }

  int getId() {
    final id = messages.last["mensagens_id"];
    return id;
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
