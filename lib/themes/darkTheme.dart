import 'package:flutter/material.dart';
import 'package:flutter_job/themes/colors.dart';

ThemeData dark = ThemeData(
  
  scaffoldBackgroundColor: deepColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: buttonColor,
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: buttonColor,
    selectedItemColor: Color.fromARGB(255, 223, 103, 139)
  ),
  cardTheme: const CardTheme(
    color: lightColor2,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(buttonColor),
      shape: MaterialStatePropertyAll(borderButton),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(buttonColor),
      shape: MaterialStatePropertyAll(borderButton),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: buttonColor,
  ),
);

RoundedRectangleBorder borderButton = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10),

  ),
  side:  BorderSide(
      color:  Colors.white
    )
);
