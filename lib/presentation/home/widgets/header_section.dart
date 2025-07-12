import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'greeting_section.dart';
import 'profile_picture.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.h, 20.h, 20.h, 8.h),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [GreetingSection(), ProfilePicture()],
      ),
    );
  }
}
