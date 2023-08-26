import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/routes/routes.dart';

class MyEventsList extends ConsumerWidget {
  const MyEventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myEventsControllerProvider);

    if (state.isUpcomingEventsActive) {
      return Column(
        children: [
          for (var ticket in state.upcomingEvents)
            Column(
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(
                    Routes.ticketDetail.name,
                    extra: Extras(
                      datas: {
                        ExtrasKey.ticket: ticket,
                      },
                    ),
                  ),
                  child: CardEventWidget(ticket.event!),
                ),
                Gap.h20,
              ],
            ),
        ],
      );
    } else {
      return Column(
        children: [
          for (var ticket in state.pastEvents)
            Column(
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(
                    Routes.ticketDetail.name,
                    extra: Extras(
                      datas: {
                        ExtrasKey.ticket: ticket,
                      },
                    ),
                  ),
                  child: CardEventWidget(ticket.event!),
                ),
                Gap.h20,
              ],
            ),
        ],
      );
    }
  }
}
