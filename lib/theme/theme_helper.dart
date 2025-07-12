import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../core/utils/pref_utils.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get black => Color(0xFF1E1E1E);
  Color get white => Color(0xFFFFFFFF);
  Color get gray100 => Color(0xFFF3F4F6);
  Color get gray400 => Color(0xFF9CA3AF);

  // Additional Colors
  Color get blackCustom => Colors.black;
  Color get whiteCustom => Colors.white;
  Color get transparentCustom => Colors.transparent;
  Color get greyCustom => Colors.grey;
  Color get colorFF6EC3 => Color(0xFF6EC388);
  Color get colorFFD9D9 => Color(0xFFD9D9D9);
  Color get colorFFDCF3 => Color(0xFFDCF3EB);
  Color get colorFFE7E7 => Color(0xFFE7E7E9);
  Color get colorFFFFF8 => Color(0xFFFFF8F8);
  Color get colorFFFEDD => Color(0xFFFEDD74);
  Color get colorFF4DAA => Color(0xFF4DAA57);
  Color get colorFFDBDB => Color(0xFFDBDBDE);
  Color get colorFF9590 => Color(0xFF959090);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
