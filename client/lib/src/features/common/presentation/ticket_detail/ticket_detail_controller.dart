import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/domain.dart';
import 'package:setiket/src/features/common/presentation/ticket_detail/ticket_detail_state.dart';

class TicketDetailController extends StateNotifier<TicketDetailState> {
  TicketDetailController() : super(TicketDetailState());

  void setTicket(Ticket ticket) {
    state = state.copyWith(
      ticket: ticket,
      ticketValue: AsyncData(ticket),
    );
  }
}

final ticketDetailControllerProvider =
    StateNotifierProvider<TicketDetailController, TicketDetailState>((ref) {
  return TicketDetailController();
});
