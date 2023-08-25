import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/common/domain/domain.dart';
import 'package:setiket/src/features/common/domain/request_ticket.dart';
import 'package:setiket/src/features/common/presentation/checkout/checkout_state.dart';

class CheckoutController extends StateNotifier<CheckoutState> {
  final CommonService _commonService;
  CheckoutController(this._commonService) : super(CheckoutState());

  void setTicket(Ticket ticket) {
    state = state.copyWith(
      ticket: ticket,
      ticketValue: AsyncData(ticket),
    );
  }

  Future<void> buyTicket() async {
    // loading
    state = state.copyWith(
      checkoutValue: const AsyncLoading(),
    );

    final requestTicket = RequestTicket(
      quantity: state.ticket!.quantity,
      eventId: state.ticket!.eventId,
      userId: state.ticket!.userId,
    );

    final result = await _commonService.createTicket(requestTicket);

    result.when(
      success: (data) {
        // success
        state = state.copyWith(
          checkoutValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        // failure
        state = state.copyWith(
          checkoutValue: AsyncError(error, stackTrace),
        );
      },
    );
  }
}

final checkoutControllerProvider =
    StateNotifierProvider<CheckoutController, CheckoutState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return CheckoutController(commonService);
});
