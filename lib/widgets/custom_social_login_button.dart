import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/// CustomSocialLoginButton - A reusable social login button component
///
/// This widget creates a styled button with an icon and text, commonly used for social login functionality.
/// Features include customizable colors, icon, text, and press handlers.
///
/// @param text - The text displayed on the button
/// @param iconPath - Path to the icon image (supports all image types)
/// @param onPressed - Callback function when button is pressed
/// @param backgroundColor - Background color of the button
/// @param borderColor - Border color of the button
/// @param textColor - Color of the text
/// @param width - Width of the button (defaults to full width)
class CustomSocialLoginButton extends StatelessWidget {
  const CustomSocialLoginButton({
    super.key,
    required this.text,
    required this.iconPath,
    this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.width,
  });

  /// The text displayed on the button
  final String text;

  /// Path to the icon image
  final String iconPath;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Border color of the button
  final Color? borderColor;

  /// Color of the text
  final Color? textColor;

  /// Width of the button
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 32.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? appTheme.whiteCustom,
          side: BorderSide(
            color: borderColor ?? appTheme.colorFFDBDB,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(imagePath: iconPath, height: 20.h, width: 20.h),
            SizedBox(width: 7.h),
            Expanded(
              child: Text(
                text,
                style: TextStyleHelper.instance.label11Cabin.copyWith(
                  color: textColor ?? appTheme.colorFFDBDB,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
