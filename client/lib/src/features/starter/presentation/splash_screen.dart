import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_config/palette.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = 'splashScreen';

  @override
  ConsumerState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        backgroundColor: Palette.color,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              Text('Splash Screen'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initPage() async {
    // TODO : init page
  }
}
