import 'package:flutter/material.dart';

import 'darkmode.dart';
import 'lightmode.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData themeData = lightmode;

  bool isDarkMode()
  {
    return themeData==darkmode ;
  }

  void toggleTheme()
  {
    if(themeData==lightmode)
    {
      themeData = darkmode;
      notifyListeners();
    }

    else
    {
      themeData = lightmode;
      notifyListeners();
    }
  }
}