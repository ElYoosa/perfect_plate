import 'package:flutter/material.dart';

import '../../../../core/app_export.dart';
import '../models/login_model.dart';

part 'login_state.dart';

final loginNotifier =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
      (ref) => LoginNotifier(LoginState(loginModel: LoginModel())),
    );

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(super.state) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      isLoading: false,
    );
  }

  void updateEmail(String email) {
    state = state.copyWith(
      loginModel: state.loginModel?.copyWith(email: email),
    );
  }

  void updatePassword(String password) {
    state = state.copyWith(
      loginModel: state.loginModel?.copyWith(password: password),
    );
  }

  void handleLogin() {
    if (state.emailController?.text.isEmpty ?? true) {
      return;
    }

    if (state.passwordController?.text.isEmpty ?? true) {
      return;
    }

    state = state.copyWith(isLoading: true);

    // Simulate login process
    Future.delayed(Duration(seconds: 2), () {
      state = state.copyWith(isLoading: false, isLoginSuccess: true);

      // Navigate to home screen after successful login
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
    });
  }

  void handleSocialLogin(String provider) {
    state = state.copyWith(isLoading: true);

    // Simulate social login process
    Future.delayed(Duration(seconds: 1), () {
      state = state.copyWith(isLoading: false, isLoginSuccess: true);

      // Navigate to home screen after successful social login
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
    });
  }

  void handleForgotPassword() {
    // Handle forgot password navigation or action
    // NavigatorService.pushNamed(AppRoutes.forgotPasswordScreen);
  }

  void navigateToRegister() {
    // Handle navigation to register screen
    // NavigatorService.pushNamed(AppRoutes.registerScreen);
  }

  @override
  void dispose() {
    state.emailController?.dispose();
    state.passwordController?.dispose();
    super.dispose();
  }
}
