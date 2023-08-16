import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/features/presentation.dart';

class LoginController extends StateNotifier<LoginState> {
  final AuthService _authService;
  LoginController(this._authService) : super(const LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    // loading
    state = state.copyWith(
      loginValue: const AsyncLoading(),
    );

    final requestLogin = RequestLogin(
      email: emailController.text,
      password: passwordController.text,
    );

    final result = await _authService.login(requestLogin);

    result.when(
      success: (data) {
        // success
        state = state.copyWith(
          loginValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        // failure
        state = state.copyWith(
          loginValue: AsyncError(error, stackTrace),
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final loginControllerProvider = StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
  final authService = ref.read(authServiceProvider);
  return LoginController(authService);
});
