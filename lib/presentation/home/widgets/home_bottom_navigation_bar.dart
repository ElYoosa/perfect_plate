import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../notifier/home_notifier.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key, required this.onTap});

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(homeNotifier);

        return Container(
          height: 72.h,
          decoration: BoxDecoration(
            color: appTheme.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              topRight: Radius.circular(20.h),
            ),
            boxShadow: [
              BoxShadow(
                color: appTheme.greyCustom,
                spreadRadius: 2,
                blurRadius: 8,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: state.selectedIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: appTheme.colorFF4DAA,
            unselectedItemColor: appTheme.gray400,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              ref.read(homeNotifier.notifier).onBottomNavTap(index);
              onTap(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 28.h),
                activeIcon: Icon(Icons.home, size: 28.h),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined, size: 28.h),
                activeIcon: Icon(Icons.search, size: 28.h),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border_outlined, size: 28.h),
                activeIcon: Icon(Icons.bookmark, size: 28.h),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 28.h),
                activeIcon: Icon(Icons.person, size: 28.h),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
