import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';

class LoginFormSection extends ConsumerWidget {
  const LoginFormSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign in',
          style: TypographyApp.headline1.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap.h20,
        InputFormWidget(
          controller: controller.emailController,
          onChanged: (value) {},
          hintText: 'abc@gmail.com',
          prefixIcon: Icons.email_outlined,
        ),
        Gap.h16,
        InputFormWidget.password(
          controller: controller.passwordController,
          onChanged: (value) {},
          hintText: 'Your Password',
          isObscure: state.isObscure,
          onObscureTap: controller.onObscureTap,
          prefixIcon: Icons.lock_outline,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TypographyApp.text1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
