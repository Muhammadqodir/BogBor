import 'package:bogbor/constraints.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFF4dc157);
const textColorLight = Color(0xFF444444);
const textColorDark = Color(0xFFFFFFFF);
const primaryGradinet = LinearGradient(colors: [Color(0xFF4dc157), Color(0xFF5cd866)], begin: Alignment.topLeft, end: Alignment.bottomRight);

BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 0.4,
  blurRadius: 1,
  offset: const Offset(0, 1),
);

ThemeData lightTheme = ThemeData(
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: primaryColor,
        width: 2,
      ),
    ),
  ),
  brightness: Brightness.light,
  primaryColor: primaryColor,
  hintColor: textColorLight.withAlpha(180),
  cardColor: const Color(0xFFC8C8C8),
  dividerColor: Colors.grey.withAlpha(100),
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: textColorLight,
      fontSize: textSizeSmall,
    ),
    bodyMedium: TextStyle(
      color: textColorLight,
      fontSize: textSizeMedium,
    ),
    bodyLarge: TextStyle(
      color: textColorLight,
      fontSize: textSizeLange,
    ),
    titleLarge: TextStyle(
      fontFamily: "MontserratBold",
      color: textColorLight,
      fontSize: textSizeLange,
    ),
    titleMedium: TextStyle(
      fontFamily: "MontserratBold",
      color: textColorLight,
      fontSize: textSizeMedium,
    ),
    titleSmall: TextStyle(
      color: textColorLight,
      fontFamily: "MontserratBold",
      fontSize: textSizeSmall,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
);

ThemeData darkTheme = ThemeData(
  tabBarTheme: const TabBarTheme(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: primaryColor,
        width: 2,
      ),
    ),
  ),
  brightness: Brightness.light,
  primaryColor: primaryColor,
  hintColor: textColorDark.withAlpha(180),
  cardColor: const Color(0xFF1F1F1F),
  dividerColor: Colors.grey.withAlpha(100),
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: textColorDark,
      fontSize: textSizeSmall,
    ),
    bodyMedium: TextStyle(
      color: textColorDark,
      fontSize: textSizeMedium,
    ),
    bodyLarge: TextStyle(
      color: textColorDark,
      fontSize: textSizeLange,
    ),
    titleLarge: TextStyle(
      fontFamily: "MontserratBold",
      color: textColorDark,
      fontSize: textSizeLange,
    ),
    titleMedium: TextStyle(
      fontFamily: "MontserratBold",
      color: textColorDark,
      fontSize: textSizeMedium,
    ),
    titleSmall: TextStyle(
      color: textColorDark,
      fontFamily: "MontserratBold",
      fontSize: textSizeSmall,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF121111),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121111),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF121111),
    elevation: 0,
  ),
);
