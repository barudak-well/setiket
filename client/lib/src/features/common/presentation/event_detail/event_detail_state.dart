import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/event.dart';

class EventDetailState {
  final AsyncValue<Event?> eventValue;
  final Event? event;
  final bool isBookmarkEvent;
  final int quantity;
  const EventDetailState({
    this.eventValue = const AsyncLoading(),
    this.event,
    this.quantity = 1,
    this.isBookmarkEvent = false,
  });

  EventDetailState copyWith({
    AsyncValue<Event?>? eventValue,
    Event? event,
    int? quantity,
    bool? isBookmarkEvent,
  }) {
    return EventDetailState(
      eventValue: eventValue ?? this.eventValue,
      event: event ?? this.event,
      quantity: quantity ?? this.quantity,
      isBookmarkEvent: isBookmarkEvent ?? this.isBookmarkEvent,
    );
  }
}
