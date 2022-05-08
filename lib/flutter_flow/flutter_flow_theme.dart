// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color background;
  Color darkBackground;
  Color textColor;
  Color grayDark;
  Color grayLight;
  Color errorRed;
  Color grayIcon;
  Color gray200;
  Color gray600;
  Color black600;
  Color tertiary400;

  TextStyle get title1 => TextStyle(
        fontFamily: 'Gotham',
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );
  TextStyle get title2 => TextStyle(
        fontFamily: 'Gotham',
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 28,
      );
  TextStyle get title3 => TextStyle(
        fontFamily: 'Gotham',
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get subtitle1 => TextStyle(
        fontFamily: 'Dank Mono',
        color: grayLight,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  TextStyle get subtitle2 => TextStyle(
        fontFamily: 'Dank Mono',
        color: grayLight,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      );
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'Gotham',
        color: grayLight,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'Gotham',
        color: textColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF634C3C);
  Color secondaryColor = const Color(0xFFBADAE7);
  Color tertiaryColor = const Color(0xFFB58E4E);
  Color alternate = const Color(0xFFF7A093);
  Color primaryBackground = const Color(0xFF000000);
  Color secondaryBackground = const Color(0xFF404040);
  Color primaryText = const Color(0xFF090F13);
  Color secondaryText = const Color(0xFF95A1AC);

  Color background = Color(0xFF04111E);
  Color darkBackground = Color(0xFF04111E);
  Color textColor = Color(0xFFFFFFFF);
  Color grayDark = Color(0xFF57636C);
  Color grayLight = Color(0xFF8B97A2);
  Color errorRed = Color(0xFFF06A6A);
  Color grayIcon = Color(0xFF95A1AC);
  Color gray200 = Color(0xFFDBE2E7);
  Color gray600 = Color(0xFF262D34);
  Color black600 = Color(0xFF090F13);
  Color tertiary400 = Color(0xFF39D2C0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
