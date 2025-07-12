import '../../../../core/app_export.dart';

/// This class is used in the [LoginScreen] screen.

// ignore_for_file: must_be_immutable
class LoginModel extends Equatable {
  LoginModel({this.email, this.password, this.rememberMe}) {
    email = email ?? '';
    password = password ?? '';
    rememberMe = rememberMe ?? false;
  }

  String? email;
  String? password;
  bool? rememberMe;

  LoginModel copyWith({String? email, String? password, bool? rememberMe}) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object?> get props => [email, password, rememberMe];
}
