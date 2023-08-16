import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

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
        children: [
          InputFormWidget(
            controller: controller.emailController,
            onChanged: (value) {
              controller.resetErrors('email');
            },
            hintText: 'Email',
            errorText: state.errors.error('email'),
            validator: controller.validateEmail,
          ),
          Gap.h16,
          InputFormWidget.password(
            controller: controller.passwordController,
            onChanged: (value) {
              controller.resetErrors('password');
            },
            hintText: 'Password',
            onObscureTap: controller.onObscureTap,
            isObscure: state.isObscure,
            errorText: state.errors.error('password'),
            validator: controller.validatePassword,
          ),
          Gap.h16,
          InputFormWidget(
            controller: controller.usernameController,
            onChanged: (value) {
              controller.resetErrors('username');
            },
            hintText: 'Username',
            errorText: state.errors.error('username'),
            validator: controller.validateUsername,
          ),
          Gap.h16,
          InputFormWidget.button(
            controller: controller.birthdateController,
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: state.birthDate ?? DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime.now(),
              );
              controller.onBirthDatePicked(pickedDate);
            },
            hintText: 'Birthdate',
            errorText: state.errors.error('birthdate'),
            validator: controller.validateBirthdate,
          ),
          Gap.h16,
          DropdownWidget<int>(
            hintText: 'Gender',
            items: [
              DropdownMenuItem(
                value: 0,
                child: Text(
                  'Male',
                  style: TypographyApp.text1,
                ),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text(
                  'Female',
                  style: TypographyApp.text1,
                ),
              ),
            ],
            onChanged: controller.onGenderChanged,
            value: state.gender,
          )
        ],
      ),
    );
  }
}
