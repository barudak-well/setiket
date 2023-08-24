import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class MyEventsPage extends ConsumerWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myEventsControllerProvider);

    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: PaddingWidget(
            child: Column(
              children: [
                Gap.h48,
                const MyEventsTopBar(),
                Gap.customGapHeight(context.screenHeightPercentage(.03)),
                const MyEventsStatus(),
                Gap.customGapHeight(context.screenHeightPercentage(.15)),
                AsyncValueWidget(
                  value: state.eventListValue,
                  data: (data) {
                    if (data.isEmpty) {
                      return const NoUpcomingEvent();
                    } else {
                      return const MyEventsList();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
