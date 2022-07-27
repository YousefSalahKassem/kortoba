

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

  // static final darkTheme = ThemeData(
  //   colorScheme: const ColorScheme.dark().copyWith(
  //     primary: ColorValues.primarySwatch,
  //   ),
  //   iconTheme: const IconThemeData(color: ColorValues.darkGrayColor),
  //   scaffoldBackgroundColor: ColorValues.darkBgColor,
  //   shadowColor: ColorValues.lightGrayColor,
  //   appBarTheme: const AppBarTheme(backgroundColor: ColorValues.darkBgColor),
  //   bottomAppBarColor: ColorValues.darkBgColor,
  //   cardTheme: const CardTheme(color: ColorValues.darkColor),
  //   dialogTheme: const DialogTheme(backgroundColor: ColorValues.darkColor),
  //   bottomSheetTheme: const BottomSheetThemeData().copyWith(
  //     backgroundColor: ColorValues.darkColor,
  //   ),
  //   dividerColor: ColorValues.darkerGrayColor,
  //   snackBarTheme: const SnackBarThemeData(
  //     backgroundColor: ColorValues.lightBgColor,
  //     contentTextStyle: TextStyle(
  //       color: ColorValues.blackColor,
  //     ),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: const ButtonStyle().copyWith(
  //       backgroundColor: MaterialStateProperty.all(ColorValues.primaryColor),
  //       foregroundColor: MaterialStateProperty.all(ColorValues.whiteColor),
  //       elevation: MaterialStateProperty.all(0.0),
  //     ),
  //   ),
  //   textTheme: const TextTheme().copyWith(
  //     bodyText1: const TextStyle(
  //       color: ColorValues.lightBgColor,
  //     ),
  //     subtitle1: const TextStyle(
  //       color: ColorValues.grayColor,
  //     ),
  //   ),
  //   brightness: Brightness.dark,
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  // );
}