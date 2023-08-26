import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/features/common/domain/ticket.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class TicketDetail extends ConsumerStatefulWidget {
  final Ticket ticket;
  const TicketDetail({
    super.key,
    required this.ticket,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketDetailState();
}

class _TicketDetailState extends ConsumerState<TicketDetail> {
  TicketDetailController get controller =>
      ref.read(ticketDetailControllerProvider.notifier);
  TicketDetailState get state => ref.watch(ticketDetailControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.setTicket(widget.ticket);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      child: Scaffold(
        body: AsyncValueWidget(
          value: state.ticketValue,
          data: (data) {
            return const SingleChildScrollView(
                child: TicketDetailContentSection());
          },
        ),
      ),
    );
  }
}
