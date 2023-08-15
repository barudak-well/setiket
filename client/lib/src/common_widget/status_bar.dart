import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar extends StatelessWidget {
  final Brightness brightness;
  final Widget child;

  const StatusBar({
    Key? key,
    this.brightness = Brightness.dark,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: brightness,
        statusBarColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
