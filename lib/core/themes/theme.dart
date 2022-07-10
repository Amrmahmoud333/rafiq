import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeOfProject {
  static final ligthTheme = ThemeData(
    fontFamily: 'DavidLibre',
    primaryColor: const Color(0XFF5B618A),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Color(0XFF5B618A),
      ),
      iconTheme: IconThemeData(
        color: Color(0XFF5B618A),
      ),
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: const Color(0xffE8DEEB),
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0XFF5B618A),
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0XFF5B618A),
      ),
      headline4: TextStyle(
        fontSize: 25,
        color: Color(0XFF5B618A),
      ),
      headline3: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Color(0XFF5B618A),
      ),
      headline2: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w500,
        color: Color(0XFF5B618A),
      ),
      headline1: TextStyle(
        fontFamily: 'DavidLibre',
        fontWeight: FontWeight.bold,
        fontSize: 35,
        color: Color(0xff5B618A),
      ),
    ),
  );
}

TextStyle lableInputField(double size) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF5B618A),
  );
}
