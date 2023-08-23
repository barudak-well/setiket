import 'package:setiket/src/features/common/domain/event.dart';

class EventDetailState {
  final Event? event;
  final bool isBookmarkEvent;
  final int quantity;
  EventDetailState(
      {this.event, this.quantity = 1, this.isBookmarkEvent = false});

  EventDetailState copyWith({
    Event? event,
    int? quantity,
    bool? isBookmarkEvent,
  }) {
    return EventDetailState(
      event: event ?? this.event,
      quantity: quantity ?? this.quantity,
      isBookmarkEvent: isBookmarkEvent ?? this.isBookmarkEvent,
    );
  }
}
