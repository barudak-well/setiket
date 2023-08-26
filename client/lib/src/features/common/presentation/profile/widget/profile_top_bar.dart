import 'package:flutter/widgets.dart';
import 'package:setiket/src/constants/constants.dart';

class ProfileTopBar extends StatelessWidget {
  const ProfileTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Profile',
      style: TypographyApp.headline3.copyWith(fontSize: 24),
    );
  }
}
