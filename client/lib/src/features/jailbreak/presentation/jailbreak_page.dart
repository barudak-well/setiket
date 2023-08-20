import 'package:flutter/material.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';

class JailbreakPage extends StatelessWidget {
  const JailbreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const StatusBarWidget(
      child: Scaffold(
        body: CircleBackgroundWidget(
          child: Center(
            child: Text('Your device is detected jailbreak!'),
          ),
        ),
      ),
    );
  }
}
