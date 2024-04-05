import 'package:flutter/material.dart';
import '../../models/models.dart';

class UserSessionProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  void initUser(UserModel? user) {
    this.user = user;
  }
}
