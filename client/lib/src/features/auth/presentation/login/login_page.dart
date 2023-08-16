import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/routes/routes.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';
import 'package:overlay_support/overlay_support.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginControllerProvider, (prevState, state) {
      if (prevState?.loginValue != state.loginValue) {
        state.loginValue.whenOrNull(
          data: (data) {
            if (data != null) {
              context.goNamed(Routes.home.name);
            }
          },
          error: (error, stackTrace) {
            final message =
                NetworkExceptions.getErrorMessage(error as NetworkExceptions);
            toast(message);
          },
        );
      }
    });

    return StatusBarWidget(
      child: Scaffold(
        body: CircleBackgroundWidget(
          child: PaddingWidget(
            child: Column(
              children: [
                const Spacer(),
                Center(
                  child: Assets.icons.setiketLogo.svg(
                    width: context.screenWidthPercentage(0.60),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Gap.h32,
                const LoginFormSection(),
                Gap.h32,
                const LoginButtonSection(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TypographyApp.headline3,
                    ),
                    Gap.w8,
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.register.name);
                      },
                      child: Text(
                        'Sign Up',
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
    );
  }
}
