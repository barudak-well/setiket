import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:setiket/src/common_widget/status_bar.dart';

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
    return StatusBar(
      child: Scaffold(
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
