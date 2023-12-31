import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/presentation/home/home_controller.dart';
import 'package:setiket/src/features/common/presentation/home/widget/event_invitation_widget.dart';
import 'package:setiket/src/features/common/presentation/home/widget/event_title_content_widget.dart';
import 'package:setiket/src/features/common/presentation/home/widget/home_banner_widget.dart';
import 'package:setiket/src/features/common/presentation/home/widget/home_event_content_section.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    final state = ref.watch(homeControllerProvider);
    final eventList = state.home?.eventListItems;
    return AsyncValueWidget(
      value: state.homeValue,
      data: (value) {
        return StatusBarWidget(
          brightness: Brightness.light,
          child: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeBannerWidget(controller),
                      Gap.customGapHeight(context.screenHeightPercentage(.05)),
                      const EventTitleContentWidget(title: 'Upcoming Events'),
                      HomeEventContentSection(eventList: eventList),
                      Gap.customGapHeight(context.screenHeightPercentage(.03)),
                      const EventInvitationWidget(),
                      Gap.customGapHeight(context.screenHeightPercentage(.04)),
                      const EventTitleContentWidget(title: 'Popular Events'),
                      HomeEventContentSection(eventList: eventList),
                      Gap.customGapHeight(context.screenHeightPercentage(.03)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
