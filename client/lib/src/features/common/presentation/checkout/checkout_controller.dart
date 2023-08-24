import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/domain.dart';
import 'package:setiket/src/features/common/presentation/checkout/checkout_state.dart';

class CheckoutController extends StateNotifier<CheckoutState> {
  CheckoutController() : super(CheckoutState());

  void setTicket(Ticket ticket) {
    state = state.copyWith(
      ticket: ticket,
      ticketValue: AsyncData(ticket),
    );
  }
}

final checkoutControllerProvider =
    StateNotifierProvider<CheckoutController, CheckoutState>((ref) {
  return CheckoutController();
});
