import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/domain/ticket.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/routes/routes.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class EventDetailButtonSection extends ConsumerWidget {
  const EventDetailButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventDetailControllerProvider);
    final stateHome = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    final detailEvent = state.event!;
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
              text: 'BUY TICKET',
              isEnabled: true,
              height: SizeApp.h72,
              onTap: () {
                if (controller.checkUser()) {
                  context.pushNamed(
                    Routes.checkout.name,
                    extra: Extras(
                      datas: {
                        ExtrasKey.ticket: Ticket(
                          id: 0,
                          eventId: state.event!.id,
                          userId: stateHome.user!.id,
                          quantity: state.quantity,
                          price: detailEvent.ticketPrice * state.quantity,
                          event: detailEvent,
                        )
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
