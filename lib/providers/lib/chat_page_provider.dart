import 'package:flutter/material.dart';

class ChatPageProvider extends ChangeNotifier {
  String? _chatId = "";
  String? get chatId => _chatId;

  set chatId(String? id) {
    _chatId = id;
    notifyListeners();
  }

  void setSelectedChatId(String? id) {
    chatId = "/message/$id";
  }
}
