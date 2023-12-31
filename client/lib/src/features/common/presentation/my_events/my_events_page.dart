import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class MyEventsPage extends ConsumerStatefulWidget {
  const MyEventsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends ConsumerState<MyEventsPage> {
  MyEventsController get controller =>
      ref.read(myEventsControllerProvider.notifier);
  MyEventsState get state => ref.watch(myEventsControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getMyEvents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: PaddingWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap.h48,
                const MyEventsTopBar(),
                Gap.customGapHeight(context.screenHeightPercentage(.03)),
                const MyEventsStatus(),
                Gap.customGapHeight(context.screenHeightPercentage(.05)),
                AsyncValueWidget(
                  value: state.upcomingEventsValue,
                  data: (data) {
                    if (data.isEmpty) {
                      return Column(
                        children: [
                          Gap.customGapHeight(
                              context.screenHeightPercentage(.1)),
                          const NoUpcomingEvent(),
                        ],
                      );
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
