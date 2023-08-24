import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/ticket.dart';

class CheckoutState {
  final AsyncValue<Ticket?> ticketValue;
  final Ticket? ticket;
  CheckoutState({
    this.ticketValue = const AsyncLoading(),
    this.ticket,
  });

  CheckoutState copyWith({
    AsyncValue<Ticket?>? ticketValue,
    Ticket? ticket,
  }) {
    return CheckoutState(
      ticketValue: ticketValue ?? this.ticketValue,
      ticket: ticket ?? this.ticket,
    );
  }
}
