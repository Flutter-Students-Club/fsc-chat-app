import 'package:flutter/material.dart';

Color primaryColor = Color(0xff3FA9F5);
Color appBarColor = Color(0xffdedede);

ThemeData customTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(centerTitle: true, backgroundColor: primaryColor),
    scaffoldBackgroundColor: appBarColor);
