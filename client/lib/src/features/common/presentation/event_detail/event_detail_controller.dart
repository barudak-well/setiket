import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/event.dart';
import 'package:setiket/src/features/presentation.dart';

class EventDetailController extends StateNotifier<EventDetailState> {
  EventDetailController() : super(EventDetailState());

  void setEvent(Event event) {
    state = state.copyWith(event: event);
  }
}

final eventDetailControllerProvider =
    StateNotifierProvider<EventDetailController, EventDetailState>((ref) {
  return EventDetailController();
});
