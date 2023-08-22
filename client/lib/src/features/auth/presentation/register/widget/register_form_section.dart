import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/common_widgets/input_form/dropdown_form_widget.dart';
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
      key: state.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign up',
            style: TypographyApp.headline1.medium,
          ),
          Gap.h20,
          InputFormWidget(
            controller: controller.emailController,
            onChanged: (value) {},
            hintText: 'abc@gmail.com',
            prefixIcon: Icons.email_outlined,
            validator: controller.validateEmail,
          ),
          Gap.h16,
          InputFormWidget(
            controller: controller.nameController,
            onChanged: (value) {},
            hintText: 'Full name',
            prefixIcon: Icons.person_outline_rounded,
            validator: controller.validateName,
          ),
          Gap.h16,
          InputFormWidget.password(
            controller: controller.passwordController,
            onChanged: (value) {},
            hintText: 'Your Password',
            isObscure: state.isObscure,
            prefixIcon: Icons.lock_outline,
            onObscureTap: controller.onObscureTap,
            validator: controller.validatePassword,
          ),
          Gap.h16,
          InputFormWidget.password(
            controller: controller.passwordConfirmController,
            onChanged: (value) {},
            hintText: 'Confirm Password',
            isObscure: state.isObscureConfirm,
            prefixIcon: Icons.lock_outline,
            onObscureTap: controller.onObscureConfirmTap,
            validator: controller.validatePasswordConfirm,
          ),
          Gap.h16,
          DropdownFormWidget(
            value: state.roleValue,
            list: state.roles,
            prefixIcon: Icons.person_outline_rounded,
            onChanged: (value) {
              if (value.isNotNull()) {
                controller.onRoleValueChanged(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
