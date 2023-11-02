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
            height: 0.14)));
