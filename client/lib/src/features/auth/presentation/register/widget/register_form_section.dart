import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';

class RegisterFormSection extends ConsumerWidget {
  const RegisterFormSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);
    final controller = ref.read(registerControllerProvider.notifier);
    return Form(
      onChanged: controller.validateForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign up',
            style: TypographyApp.headline1.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap.h20,
          InputFormWidget(
            controller: controller.nameController,
            onChanged: (value) {},
            hintText: 'Full name',
            prefixIcon: Icons.person_outline_rounded,
          ),
          Gap.h16,
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
          Gap.h16,
          InputFormWidget.password(
            controller: controller.passwordConfirmController,
            onChanged: (value) {},
            hintText: 'Confirm Password',
            isObscure: state.isObscureConfirm,
            onObscureTap: controller.onObscureConfirmTap,
            prefixIcon: Icons.lock_outline,
          ),
        ],
      ),
    );
  }
}
