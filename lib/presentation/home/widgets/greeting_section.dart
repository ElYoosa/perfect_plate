import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../notifier/home_notifier.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final userName = ref.watch(homeNotifier).homeModel?.userName ?? '';
            return Text(
              userName,
              style: TextStyleHelper.instance.title22Bold.copyWith(
                height: 1.23,
              ),
            );
          },
        ),
        SizedBox(height: 4.h),
        Text(
          'What do you want to cook?',
          style: TextStyleHelper.instance.body12.copyWith(height: 1.25),
        ),
      ],
    );
  }
}
