import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/event.dart';
import 'package:setiket/src/features/common/presentation/my_events/my_events_state.dart';

class MyEventsController extends StateNotifier<MyEventsState> {
  MyEventsController() : super(const MyEventsState());

  void setEvent(List<Event> eventList) {
    state = state.copyWith(
      eventList: eventList,
      eventListValue: AsyncData(eventList),
    );
  }
}

final myEventsControllerProvider =
    StateNotifierProvider<MyEventsController, MyEventsState>((ref) {
  return MyEventsController();
});
