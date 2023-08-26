import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/ticket.dart';

class TicketDetailState {
  final AsyncValue<Ticket?> ticketValue;
  final Ticket? ticket;
  TicketDetailState({
    this.ticketValue = const AsyncLoading(),
    this.ticket,
  });

  TicketDetailState copyWith({
    AsyncValue<Ticket?>? ticketValue,
    Ticket? ticket,
  }) {
    return TicketDetailState(
      ticketValue: ticketValue ?? this.ticketValue,
      ticket: ticket ?? this.ticket,
    );
  }
}
