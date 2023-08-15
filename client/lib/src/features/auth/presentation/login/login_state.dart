import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final AsyncValue<String?> loginValue;
  final bool isObscure;
  const LoginState({
    this.loginValue = const AsyncData(null),
    this.isObscure = true,
  });

  bool get isLoading => loginValue.isLoading;

  LoginState copyWith({
    AsyncValue<String?>? loginValue,
    bool? isObscure,
  }) {
    return LoginState(
      loginValue: loginValue ?? this.loginValue,
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
