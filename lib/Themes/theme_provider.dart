import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_flutter/Themes/theme.dart';

class ThemeProvider with ChangeNotifier{
 bool isDarkMode = false;
  ThemeData get currentTheme => isDarkMode ? darkMode : lightMode;
 void changeSwitchState(){
   isDarkMode= !isDarkMode;
   notifyListeners();
 }
}