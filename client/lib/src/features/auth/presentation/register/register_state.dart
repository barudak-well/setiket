import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AsyncValue<String?> registerValue;
  final bool isObscure;
  final bool isObscureConfirm;
  final Map<String, dynamic>? errors;
  final String roleValue;
  final List<Map<String, String>> roles;
  RegisterState({
    this.registerValue = const AsyncData(null),
    this.isObscure = true,
    this.isObscureConfirm = true,
    this.errors,
    this.roleValue = 'USER',
  }) : roles = [
          {
            'text': 'User',
            'value': 'USER',
          },
          {
            'text': 'Event Organizer',
            'value': 'EO',
          },
        ];

  bool get isLoading => registerValue.isLoading;

  RegisterState copyWith({
    AsyncValue<String?>? registerValue,
    bool? isObscure,
    bool? isObscureConfirm,
    Map<String, dynamic>? errors,
    String? roleValue,
  }) {
    return RegisterState(
      registerValue: registerValue ?? this.registerValue,
      isObscure: isObscure ?? this.isObscure,
      isObscureConfirm: isObscureConfirm ?? this.isObscureConfirm,
      errors: errors ?? this.errors,
      roleValue: roleValue ?? this.roleValue,
    );
  }
}
