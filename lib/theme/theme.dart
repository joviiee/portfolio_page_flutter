import 'package:flutter/material.dart';

const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 36, 36, 35),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 51, 53, 51),
    onSecondary: Color.fromARGB(255, 217, 217, 217),
    tertiary: Color.fromARGB(255, 245, 203, 92),
    onTertiary: Colors.black,
    error: Colors.red,
    onError: Color.fromARGB(255, 0, 0, 0),
    surface: Colors.white,
    onSurface: Colors.black);

final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: colorScheme.tertiary,
    colorScheme: colorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onTertiary,
      backgroundColor: colorScheme.tertiary,
      shadowColor: Colors.grey,
      elevation: 5,
      side: const BorderSide(width: 0),
    )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      focusColor: colorScheme.secondary,
      elevation: 5,
      hoverColor: colorScheme.secondary,
      iconSize: 20,
      mouseCursor:
          const WidgetStatePropertyAll<MouseCursor>(MouseCursor.uncontrolled),
    ),
    inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(fontSize: 20, color: colorScheme.error),
        contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        hintStyle: TextStyle(
            color: colorScheme.onSecondary,
            fontWeight: FontWeight.w500,
            wordSpacing: 3,
            letterSpacing: 3),
        iconColor: colorScheme.onPrimary,
        activeIndicatorBorder: BorderSide(
            color: colorScheme.primary,
            width: 3,
            strokeAlign: BorderSide.strokeAlignOutside),
        constraints: const BoxConstraints(maxWidth: 100)),
    cardTheme: CardTheme(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        shadowColor: colorScheme.secondary,
        margin: const EdgeInsets.all(5)),
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity);
