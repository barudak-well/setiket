import 'package:flutter/material.dart';
import 'package:setiket/src/constants/constants.dart';

class MyEventsTopBar extends StatelessWidget {
  const MyEventsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Events',
      style: TypographyApp.headline3.copyWith(fontSize: 24),
    );
  }
}
