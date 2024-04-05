import 'package:flutter/material.dart';

class DemoProvider extends ChangeNotifier {
  bool _isShow = false;
  bool get isShow => _isShow;

  set isShow(bool value) {
    _isShow = value;
    notifyListeners();
  }

  bool getIsShow() {
    return isShow;
  }

  void setIsShow(bool value) {
    isShow = value;
  }
}
