import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/common_widgets/bar/status_bar.dart';
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
    Future.delayed(const Duration(seconds: 3)).then((_) {
      ref.read(hiveServiceProvider).getUser() != null
          ? context.goNamed(Routes.home.name)
          : context.goNamed(Routes.login.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.setiketLogo.svg(
                width: context.screenWidthPercentage(0.60),
                fit: BoxFit.fitWidth,
              ),
              // Gap.h12,
              // Text('SeTiket', style: TypographyApp.headline1),
            ],
          ),
        ),
      ),
    );
  }
}
