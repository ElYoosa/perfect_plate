import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomSearchInput extends StatelessWidget {
  const CustomSearchInput({
    super.key,
    this.hintText,
    this.onChanged,
    this.textStyle,
    this.enabled,
    this.textInputAction,
    this.controller,
  });

  final String? hintText;
  final Function(String)? onChanged;
  final TextStyle? textStyle;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    // Menghapus widget Expanded dari sini.
    // TextField akan mengisi ruang yang disediakan oleh parent-nya.
    return TextField(
      controller: controller,
      enabled: enabled ?? true,
      textInputAction: textInputAction ?? TextInputAction.search,
      style:
          textStyle ?? TextStyleHelper.instance.title16.copyWith(height: 1.25),
      decoration: InputDecoration(
        hintText: hintText ?? 'Mau Masak Apa Hari ini ....',
        hintStyle: TextStyleHelper.instance.title16.copyWith(
          color: appTheme.blackCustom.withAlpha(153),
          height: 1.25,
        ),
        // Menambahkan border dan padding untuk mencocokkan desain
        filled: true,
        fillColor: appTheme.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(color: appTheme.colorFF4DAA),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
        isDense: true,
      ),
      onChanged: onChanged,
    );
  }
}
