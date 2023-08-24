import 'package:setiket/src/features/common/domain/ticket.dart';

class CheckoutState {
  final Ticket? ticket;
  CheckoutState({this.ticket});

  CheckoutState copyWith({Ticket? ticket}) {
    return CheckoutState(ticket: ticket ?? this.ticket);
  }
}
