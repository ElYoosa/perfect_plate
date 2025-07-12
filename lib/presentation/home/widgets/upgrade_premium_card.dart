import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';

class UpgradePremiumCard extends StatelessWidget {
  const UpgradePremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: appTheme.colorFFFEDD,
        borderRadius: BorderRadius.circular(15.h),
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgVectorGray50001,
            height: 30.h,
            width: 25.h,
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upgrade to Premium',
                  style: TextStyleHelper.instance.body15Bold,
                ),
                Text(
                  'Enjoy all features and more!',
                  style: TextStyleHelper.instance.label10.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 18.h),
        ],
      ),
    );
  }
}
