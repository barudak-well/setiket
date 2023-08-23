import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/data/responses/responses.dart';
import 'package:setiket/src/features/common/domain/domain.dart';
import 'package:setiket/src/features/common/presentation/checkout/checkout_state.dart';

class CheckoutController extends StateNotifier<CheckoutState> {
  CheckoutController()
      : super(CheckoutState(
          ticket: Ticket(
            id: 0,
            eventId: 0,
            userId: 0,
            quantity: 0,
            price: 0,
            event: Event(
              id: 0,
              userId: 0,
              title: 'International Band Music Concert',
              description:
                  'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
              imageUrl: '',
              startDatetime: DateTime.now(),
              endDatetime: DateTime.now(),
              city: CityEvent.bandung,
              locationDetail: 'Dipatiukur',
              ticketPrice: 50000,
              capacity: 50,
              remainingCapacity: 40,
            ),
          ),
        ));

  void setTicket(Ticket ticket) {
    state = state.copyWith(ticket: ticket);
  }
}

final checkoutControllerProvider =
    StateNotifierProvider<CheckoutController, CheckoutState>((ref) {
  return CheckoutController();
});
