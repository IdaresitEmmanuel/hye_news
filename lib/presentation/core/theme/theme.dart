import 'package:flutter/material.dart';
import 'package:hye_news/presentation/core/theme/colors.dart';
import 'package:hye_news/presentation/core/theme/dimensions.dart';

class HTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: HColors.primaryColor,
        cardColor: HColors.cardColor,
        iconTheme: IconThemeData(color: HColors.iconColor),
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFF5F1F1)),
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        dividerColor: HColors.dividerColor,
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Lato",
        primaryTextTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: HDimensions.largeText, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
            fontSize: HDimensions.bodyTextMedium,
          ),
          bodyLarge: TextStyle(
            fontSize: HDimensions.bodyTextLarge,
          ),
          bodyMedium: TextStyle(
            fontSize: HDimensions.bodyTextMedium,
          ),
          bodySmall: TextStyle(
            fontSize: HDimensions.bodyTextSmall,
          ),
        ),
      );
}
