import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final AuthService _authService;
  RegisterController(
    this._authService,
  ) : super(const RegisterState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final birthdateController = TextEditingController();

  Future<void> register() async {
    // loading
    state = state.copyWith(
      registerValue: const AsyncLoading(),
    );

    final requestRegister = RequestRegister(
      email: emailController.text,
      password: passwordController.text,
      username: usernameController.text,
      birthdate: birthdateController.text,
      gender: state.gender ?? -1,
    );

    final result = await _authService.register(requestRegister);

    result.when(
      success: (data) {
        // success
        state = state.copyWith(
          registerValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        final errors = NetworkExceptions.getErrors(error);
        // failure
        state = state.copyWith(
          registerValue: AsyncError(error, stackTrace),
          errors: errors,
        );
      },
    );
  }

  void onObscureTap() {
    // with setState in StatefulWidget
    //setState(() {
    //   isObscure = !isObscure;
    // });

    // with state.copyWith in Riverpod
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  void onBirthDatePicked(DateTime? pickedDate) {
    if (pickedDate != null) {
      resetErrors('birthdate');
      birthdateController.text = pickedDate.toYyyyMMDd;
      state = state.copyWith(
        birthDate: pickedDate,
      );
    }
  }

  void onGenderChanged(int? gender) {
    state = state.copyWith(
      gender: gender,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  void resetErrors(String key) {
    Map<String, dynamic>? map = {...?state.errors};
    map.remove(key);
    state = state.copyWith(errors: map);
  }

  void validateForm() {
    state = state.copyWith(
      isRegisterValid: validateEmail(emailController.text).isNull() &&
          validatePassword(passwordController.text).isNull() &&
          validateUsername(usernameController.text).isNull() &&
          validateBirthdate(birthdateController.text).isNull(),
    );
  }

  String? validateEmail(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be null";
    } else if (!value!.isEmailValid) {
      return "email not valid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    } else if (!value!.isPasswordValid) {
      return "Password not valid";
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  String? validateBirthdate(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }
}

final registerControllerProvider = StateNotifierProvider<RegisterController, RegisterState>((ref) {
  final authService = ref.read(authServiceProvider);
  return RegisterController(authService);
});
