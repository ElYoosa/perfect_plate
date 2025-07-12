import 'package:flutter/material.dart';
import '../presentation/auth/login/login_screen.dart';
import '../presentation/home/home_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String homeScreen = '/home_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
    loginScreen: (context) => LoginScreen(),
    homeScreen: (context) => HomeScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => AppNavigationScreen(),
  };
}
