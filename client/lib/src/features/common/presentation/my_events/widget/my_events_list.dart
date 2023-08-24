import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';

class MyEventsList extends ConsumerWidget {
  const MyEventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myEventsControllerProvider);

    return Column(
      children: [
        for (var event in state.eventList)
          Column(
            children: [
              CardEventWidget(event),
              Gap.h20,
            ],
          ),
      ],
    );
  }
}
