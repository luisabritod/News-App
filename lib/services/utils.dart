import 'package:bookmark/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get getBackgroundColor =>
      getTheme ? const Color(0xFF222222) : const Color(0xFFF5F5F5);
  Color get getColor => getTheme ? Colors.white : Colors.black;
  Color get getButtonColor =>
      getTheme ? const Color(0xff7A8979) : const Color(0xFF41573F);
  Size get getScreenSize => MediaQuery.of(context).size;

  Color get baselineShimmerColor =>
      getTheme ? const Color(0xff7A8979) : const Color(0xFF41573F);
  Color get highlightShimmerColor => getTheme
      ? const Color(0xff7A8979).withOpacity(0.5)
      : const Color(0xFF41573F).withOpacity(0.5);
  Color get widgetShimmerColor =>
      getTheme ? const Color(0xff7A8979) : const Color(0xFF41573F);
}
