import 'package:flutter/material.dart';
import 'package:setiket/src/constants/constants.dart';

class PaddingWidget extends StatelessWidget {
  final Widget child;
  const PaddingWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeApp.w32,
      ),
      child: child,
    );
  }
}
