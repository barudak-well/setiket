import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class MyEventsButtonSection extends ConsumerWidget {
  const MyEventsButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.screenHeightPercentage(.2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeApp.w32,
          vertical: SizeApp.h24,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              ColorApp.white,
              ColorApp.white.withOpacity(0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonWidget.primary(
              text: 'EXPLORE EVENTS',
              isEnabled: true,
              height: SizeApp.h72,
            ),
          ],
        ),
      ),
    );
  }
}
