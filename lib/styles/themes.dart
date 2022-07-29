

import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppThemes {
  static final lightTheme = ThemeData(

    iconTheme: const IconThemeData(color: iconColor),
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: secondaryColor,foregroundColor: backColor),
    bottomAppBarColor: secondaryColor,
    shadowColor: shadowColor,
    cardTheme: const CardTheme(color: whiteColor),
    drawerTheme: const DrawerThemeData(
      backgroundColor: primaryColor
    ),
    dialogTheme: const DialogTheme(backgroundColor: whiteColor),
    bottomSheetTheme: const BottomSheetThemeData().copyWith(
      backgroundColor: primaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: buttonColor,
    ),
    fontFamily: 'Almarai',
    dividerColor: dividerColor,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: primaryColor,
      contentTextStyle: TextStyle(
        color: whiteColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        foregroundColor: MaterialStateProperty.all(whiteColor),
        elevation: MaterialStateProperty.all(0.0),
      ),
    ),
    textTheme: const TextTheme().copyWith(
      bodyText1: const TextStyle(
        color: secondaryColor,
      ),
      subtitle1: const TextStyle(
        color: subTitleColor,
      ),
    ),
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}