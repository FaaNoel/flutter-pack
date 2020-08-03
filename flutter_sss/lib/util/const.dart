import 'package:flutter/material.dart';

class Constants {
  static String appName = "Shoes Store";

  //Color

  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red[400];
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600];

  static Color darkPrimary1 = Color(0xff515057);
  static Color lightAccent2 = Color(0xffDBC284);
  static Color lightBG2 = Color(0xff5F5E63);

  static ThemeData lightTheme = ThemeData(
      backgroundColor: lightBG,
      primaryColor: lightPrimary,
      accentColor: lightAccent,
      cursorColor: lightAccent,
      scaffoldBackgroundColor: lightBG,
      appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              title: TextStyle(
            color: darkBG,
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
          )),
          iconTheme: IconThemeData(
            color: lightAccent,
          )));

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: lightBG2,
    primaryColor: lightBG2,
    accentColor: lightAccent2,
    scaffoldBackgroundColor: darkPrimary1,
    cursorColor: lightBG2,
    appBarTheme: AppBarTheme(
      color: lightBG2,
      textTheme: TextTheme(
        title: TextStyle(
          color: lightPrimary,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );
}
