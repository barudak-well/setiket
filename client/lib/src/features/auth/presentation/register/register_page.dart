import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/routes/routes.dart';
import 'package:setiket/src/services/services.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (prevState, state) {
      if (prevState?.registerValue != state.registerValue) {
        state.registerValue.whenOrNull(
          data: (message) {
            if (message != null) {
              appSnackBar(context, ColorApp.green, message);
              context.goNamed(Routes.login.name);
            }
          },
          error: (error, stackTrace) {
            final message =
                NetworkExceptions.getErrorMessage(error as NetworkExceptions);
            appSnackBar(context, ColorApp.red, message);
          },
        );
      }
    });

    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: CircleBackgroundWidget(
            child: PaddingWidget(
              child: Column(
                children: [
                  const Spacer(),
                  const TopBarWidget(),
                  Gap.h32,
                  const RegisterFormSection(),
                  Gap.h32,
                  const RegisterButtonSection(),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TypographyApp.headline3,
                      ),
                      Gap.w8,
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Text(
                          'Sign In',
                          style: TypographyApp.headline3.copyWith(
                            color: ColorApp.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap.h36
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
