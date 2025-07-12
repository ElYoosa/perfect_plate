import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline24Bold => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF4DAA,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title22Bold => TextStyle(
        fontSize: 22.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.blackCustom,
      );

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title16Medium => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.blackCustom,
      );

  TextStyle get title16 => TextStyle(
        fontSize: 16.fSize,
        color: appTheme.blackCustom,
      );

  TextStyle get title16Bold => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.whiteCustom,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body15Bold => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF4DAA,
      );

  TextStyle get body15 => TextStyle(
        fontSize: 15.fSize,
        color: appTheme.colorFF4DAA,
      );

  TextStyle get body14 => TextStyle(
        fontSize: 14.fSize,
        color: appTheme.colorFF9590,
      );

  TextStyle get body12 => TextStyle(
        fontSize: 12.fSize,
        color: appTheme.blackCustom,
      );

  TextStyle get body12Bold => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.blackCustom,
      );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label11Cabin => TextStyle(
        fontSize: 11.fSize,
        fontFamily: 'Cabin',
      );

  TextStyle get label10 => TextStyle(
        fontSize: 10.fSize,
        color: appTheme.blackCustom,
      );
}
