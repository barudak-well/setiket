import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AsyncValue<String?> loginValue;
  final bool isObscure;
  LoginState({
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
