import 'package:flutter/material.dart';

class SideBarProvider extends ChangeNotifier {
  final List<BottomNavigationBarItem> _bottomNavigationItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.messenger),
      label: 'Chats',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.people_alt,
      ),
      label: 'Contacts',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.call,
      ),
      label: 'Calls',
    ),
  ];

  final List<String> _titles = [
    "Chats",
    "Contacts",
    "Calls",
  ];

  final List<Icon> _iconItem = [
    const Icon(Icons.messenger),
    const Icon(Icons.people_alt),
    const Icon(Icons.call),
  ];

  int _selectedScreen = 0;
  int _optionSideBar = 0;
  Offset _positionMenuContext = Offset.zero;
  Offset _posBtn = Offset.zero;
  Size _sizeBtn = Size.zero;

  Offset get positionMenuContext => _positionMenuContext;
  int get optionSideBar => _optionSideBar;
  int get selectedScreen => _selectedScreen;
  Offset get posBtn => _posBtn;
  Size get sizeBtn => _sizeBtn;

  List<BottomNavigationBarItem> get bottomNavigationItem =>
      _bottomNavigationItem;
  List<String> get titles => _titles;
  List<Icon> get iconItem => _iconItem;

  set selectedScreen(int value) {
    _selectedScreen = value;
    notifyListeners();
  }

  set optionSideBar(int value) {
    _optionSideBar = value;
    notifyListeners();
  }

  set positionMenuContext(Offset a) {
    _positionMenuContext = a;
    notifyListeners();
  }

  set posBtn(Offset value) {
    _posBtn = value;
    notifyListeners();
  }

  set sizeBtn(Size value) {
    _sizeBtn = value;
    notifyListeners();
  }

  void setOptionSideBar() {
    optionSideBar = _optionSideBar == 1 ? 0 : 1;
    notifyListeners();
  }

  void setSelectedScreen(int value) {
    selectedScreen = value;
    notifyListeners();
  }

  void setPosMenuContext(Offset a) {
    positionMenuContext = a;
  }

  void setBtn(Offset valuePos, Size valueSize) {
    posBtn = valuePos;
    sizeBtn = valueSize;
  }
}
