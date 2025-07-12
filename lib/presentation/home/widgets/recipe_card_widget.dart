import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/recipe_model.dart';

class RecipeCardWidget extends StatelessWidget {
  final RecipeModel? recipeModel;
  final bool isSmallCard;
  final VoidCallback? onTapRecipe;

  const RecipeCardWidget({
    super.key,
    this.recipeModel,
    this.isSmallCard = false,
    this.onTapRecipe,
  });

  @override
  Widget build(BuildContext context) {
    if (isSmallCard) {
      return _buildSmallRecipeCard(context);
    }
    return _buildLargeRecipeCard(context);
  }

  Widget _buildLargeRecipeCard(BuildContext context) {
    return GestureDetector(
      onTap: onTapRecipe,
      child: Container(
        height: 166.h,
        width: 232.h,
        decoration: BoxDecoration(
          color: appTheme.colorFFFFF8,
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: Stack(
          children: [
            CustomImageView(
              imagePath: recipeModel?.recipeImage ?? '',
              height: 166.h,
              width: 232.h,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(8.h),
            ),
            Positioned(
              top: 8.h,
              left: 12.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipeModel?.recipeName ?? '',
                    style: TextStyleHelper.instance.title16Medium.copyWith(
                      height: 1.25,
                    ),
                  ),
                  if (recipeModel?.videoCount != null)
                    Text(
                      recipeModel?.videoCount ?? '',
                      style: TextStyleHelper.instance.label10.copyWith(
                        height: 1.3,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallRecipeCard(BuildContext context) {
    return GestureDetector(
      onTap: onTapRecipe,
      child: Container(
        width: 150.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: appTheme.colorFFFFF8,
          borderRadius: BorderRadius.circular(8.h),
          border: Border.all(color: appTheme.colorFFFEDD, width: 1.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    recipeModel?.recipeName ?? '',
                    style: TextStyleHelper.instance.title16.copyWith(
                      height: 1.25,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 16.h,
                  width: 16.h,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomImageView(
              imagePath: recipeModel?.recipeImage ?? '',
              height: 64.h,
              width: double.maxFinite,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(4.h),
            ),
          ],
        ),
      ),
    );
  }
}
