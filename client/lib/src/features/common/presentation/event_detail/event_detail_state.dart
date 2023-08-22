import 'package:setiket/src/features/common/domain/event.dart';

class EventDetailState {
  final Event? event;
  final int quantity;
  EventDetailState({
    this.event,
    this.quantity = 1,
  });

  EventDetailState copyWith({
    Event? event,
    int? quantity,
  }) {
    return EventDetailState(
      event: event ?? this.event,
      quantity: quantity ?? this.quantity,
    );
  }
}
