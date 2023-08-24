import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/ticket.dart';

class CheckoutState {
  final AsyncValue<Ticket?> ticketValue;
  final AsyncValue<String?> checkoutValue;
  final Ticket? ticket;
  CheckoutState({
    this.ticketValue = const AsyncLoading(),
    this.checkoutValue = const AsyncData(null),
    this.ticket,
  });

  bool get isLoading => checkoutValue.isLoading;

  CheckoutState copyWith({
    AsyncValue<Ticket?>? ticketValue,
    AsyncValue<String?>? checkoutValue,
    Ticket? ticket,
  }) {
    return CheckoutState(
      ticketValue: ticketValue ?? this.ticketValue,
      ticket: ticket ?? this.ticket,
      checkoutValue: checkoutValue ?? this.checkoutValue,
    );
  }
}
