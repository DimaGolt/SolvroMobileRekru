import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      maximumSize: const Size(double.infinity, 70),
      minimumSize: const Size(68, 68),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    suffixStyle: TextStyle(fontSize: 40),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Color(0xFFB1E3F9),
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Color(0xFFB1E3F9),
      ),
    ),
    prefixIconColor: Color(0xFFB1E3F9),
    suffixIconColor: Color(0xFFB1E3F9),
    hintStyle: TextStyle(color: Color(0x7AB1E3F9), fontSize: 20.0),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(size: 32, color: Colors.white),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFFE4ECED),
    contentTextStyle: TextStyle(color: Color(0xFF007CBC), fontSize: 16),
    behavior: SnackBarBehavior.floating,
  ), colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(0xFF68A8C9, <int, Color>{
    50: Color(0xFFEDF5F9),
    100: Color(0xFFD2E5EF),
    200: Color(0xFFB4D4E4),
    300: Color(0xFF95C2D9),
    400: Color(0xFF7FB5D1),
    500: Color(0xFF68A8C9),
    600: Color(0xFF60A0C3),
    700: Color(0xFF5597BC),
    800: Color(0xFF4B8DB5),
    900: Color(0xFF3A7DA9),
  })).copyWith(background: Color(0xFF4B8DB5)),
);

extension ElevatedButtons on ThemeData {
  ButtonStyle get flatButtonThemeInverted => ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      );

  ButtonStyle get elevatedButtonThemeInverted => ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      );

  ButtonStyle get circularButtonThemeInverted => ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      );
}

extension LoginDecorations on ThemeData {
  InputDecoration passwordDecoration(
          {required bool suffixVisible, Function()? onTap}) =>
      InputDecoration(
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 32, maxWidth: 32),
        suffixIconConstraints:
            const BoxConstraints(maxHeight: 32, maxWidth: 40),
        prefixIcon: const Icon(Icons.key, size: 32),
        suffixIcon: suffixVisible
            ? InkWell(
                onTap: onTap,
                child: const Icon(Icons.visibility, size: 32),
              )
            : null,
        hintText: '******',
      );

  InputDecoration emailDecoration() => const InputDecoration(
        prefixIconConstraints: BoxConstraints(maxHeight: 32, maxWidth: 32),
        prefixIcon: Icon(Icons.account_circle, size: 32),
        hintText: 'example@email.com',
      );

  InputDecoration emailForgotDecoration() => InputDecoration(
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: lightTheme.primaryColor)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: lightTheme.primaryColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: lightTheme.primaryColor)),
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 32, maxWidth: 32),
        prefixIconColor: lightTheme.primaryColor,
        prefixIcon: const Icon(Icons.account_circle, size: 32),
        hintText: 'example@email.com',
      );
}
