import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  // int _value = 2;

  ThemeData get themeData => _themeData;
  // int get value => _value;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // set value(int value) {
  //   _value = value;
  // }

  // Future<void> toggleTheme(int mode, bool isDarkMode) async {
  //   try {
  //     Dio dio = dioWithAuth();
  //     Response response = await dio.put(
  //       '/user-info/update-darkmode',
  //       data: {"darkMode": mode},
  //     );
  //     if (response.statusCode == 200) {
  //       initDarkMode(mode, isDarkMode);
  //     }
  //   } on DioException catch (e) {
  //     print(e.response?.statusCode);
  //   }
  // }

  // void initDarkMode(int mode, bool isDarkMode) {
  //   if (isDarkMode) {
  //     themeData = darkMode;
  //   } else {
  //     themeData = lightMode;
  //   }
  //   value = mode;
  // }

  void toogleTheme(bool isDarkMode) {
    themeData = isDarkMode ? darkMode : lightMode;
  }
}
