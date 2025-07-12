import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

/// This class is used in the [category_item_widget] widget.

// ignore_for_file: must_be_immutable
class CategoryItemModel extends Equatable {
  CategoryItemModel({
    this.categoryIcon,
    this.categoryName,
    this.categoryType,
    this.backgroundColor,
  }) {
    categoryIcon = categoryIcon ?? "";
    categoryName = categoryName ?? "";
    categoryType = categoryType ?? "";
    backgroundColor = backgroundColor ?? Color(0xFFFFF8F8);
  }

  String? categoryIcon;
  String? categoryName;
  String? categoryType;
  Color? backgroundColor;

  CategoryItemModel copyWith({
    String? categoryIcon,
    String? categoryName,
    String? categoryType,
    Color? backgroundColor,
  }) {
    return CategoryItemModel(
      categoryIcon: categoryIcon ?? this.categoryIcon,
      categoryName: categoryName ?? this.categoryName,
      categoryType: categoryType ?? this.categoryType,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  List<Object?> get props => [
        categoryIcon,
        categoryName,
        categoryType,
        backgroundColor,
      ];
}
