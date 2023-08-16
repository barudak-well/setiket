import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterState {
  final AsyncValue<String?> registerValue;
  final bool isObscure;
  final DateTime? birthDate;
  final int? gender;
  final Map<String, dynamic>? errors;
  final bool isRegisterValid;
  const RegisterState({
    this.registerValue = const AsyncData(null),
    this.isObscure = true,
    this.birthDate,
    this.gender,
    this.errors,
    this.isRegisterValid = false,
  });

  bool get isLoading => registerValue.isLoading;

  RegisterState copyWith({
    AsyncValue<String?>? registerValue,
    bool? isObscure,
    DateTime? birthDate,
    int? gender,
    Map<String, dynamic>? errors,
    bool? isRegisterValid,
  }) {
    return RegisterState(
      registerValue: registerValue ?? this.registerValue,
      isObscure: isObscure ?? this.isObscure,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      errors: errors ?? this.errors,
      isRegisterValid: isRegisterValid ?? this.isRegisterValid,
    );
  }
}
