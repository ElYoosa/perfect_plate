part of 'login_notifier.dart';

class LoginState extends Equatable {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final bool isLoading;
  final bool isLoginSuccess;
  final LoginModel? loginModel;

  const LoginState({
    this.emailController,
    this.passwordController,
    this.isLoading = false,
    this.isLoginSuccess = false,
    this.loginModel,
  });

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isLoading,
        isLoginSuccess,
        loginModel,
      ];

  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isLoading,
    bool? isLoginSuccess,
    LoginModel? loginModel,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      loginModel: loginModel ?? this.loginModel,
    );
  }
}
