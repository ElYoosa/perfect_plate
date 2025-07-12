import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/category_item_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryItemModel categoryModel;
  final VoidCallback? onTapCategory;

  const CategoryItemWidget({
    super.key,
    required this.categoryModel,
    this.onTapCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCategory,
      child: Column(
        children: [
          Container(
            height: 64.h,
            width: 64.h,
            decoration: BoxDecoration(
              color: categoryModel.backgroundColor ?? Color(0xFFFFF8F8),
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Center(
              child: CustomImageView(
                imagePath: categoryModel.categoryIcon ?? '',
                height: 40.h,
                width: 40.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            categoryModel.categoryName ?? '',
            style: TextStyleHelper.instance.body14.copyWith(
              color: appTheme.blackCustom,
              height: 1.29,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
