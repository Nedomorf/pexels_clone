import 'package:flutter/material.dart';
import 'package:pexels_clone/utlis/constants.dart';

ThemeData basicTheme() => ThemeData(
    useMaterial3: true,
    fontFamily: 'DMSans',
    brightness: Brightness.light,
    primaryColor: primaryColor,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            height: 0.14),
        labelLarge: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.8,
            height: 0.06),
        labelMedium: TextStyle(
          color: primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: primaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(accentColor),
            iconColor: MaterialStatePropertyAll(primaryColor))));
