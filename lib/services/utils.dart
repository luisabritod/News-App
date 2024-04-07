import 'package:bookmark/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get getColor => getTheme ? Colors.white : Colors.black;
  Color get getButtonColor =>
      getTheme ? const Color(0xff7A8979) : const Color(0xFF41573F);
  Size get getScreenSize => MediaQuery.of(context).size;
}
