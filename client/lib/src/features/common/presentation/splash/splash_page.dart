import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/routes/routes.dart';
import 'package:setiket/src/services/services.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  @override
  initState() {
    _navigateOtherScreen();
    super.initState();
  }

  void _navigateOtherScreen() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      ref
          .read(jailbreakServiceProvider)
          .checkJailbreakStatus()
          .then((isJailBreak) {
        if (isJailBreak) {
          context.goNamed(Routes.jailbreak.name);
        } else {
          ref.read(hiveServiceProvider).getToken() != null
              ? context.goNamed(Routes.home.name)
              : context.goNamed(Routes.login.name);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      child: Scaffold(
        body: CircleBackgroundWidget(
          child: Center(
            child: Assets.icons.setiketLogo.svg(
              width: context.screenWidthPercentage(0.60),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
