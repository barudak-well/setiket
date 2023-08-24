import 'package:flutter/material.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/constants/constants.dart';

class NoUpcomingEvent extends StatelessWidget {
  const NoUpcomingEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.images.noUpcomingEvent.svg(),
        Gap.h28,
        Text(
          'No Upcoming Event',
          textAlign: TextAlign.center,
          style: TypographyApp.headline3.copyWith(fontSize: 24),
        ),
        Gap.h12,
        Text(
          'Sorry, there are no upcoming events, please check again later.',
          textAlign: TextAlign.center,
          style:
              TypographyApp.text2.copyWith(fontSize: 16, color: ColorApp.gray),
        ),
      ],
    );
  }
}
