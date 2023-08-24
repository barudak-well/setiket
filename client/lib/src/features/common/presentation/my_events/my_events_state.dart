import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/domain.dart';

class MyEventsState {
  final AsyncValue<List<Event>> eventListValue;
  final List<Event> eventList;
  const MyEventsState({
    this.eventListValue = const AsyncData([]),
    this.eventList = const [],
  });

  bool get iseventListLoading => eventListValue.isLoading;

  MyEventsState copyWith({
    AsyncValue<List<Event>>? eventListValue,
    List<Event>? eventList,
  }) {
    return MyEventsState(
      eventListValue: eventListValue ?? this.eventListValue,
      eventList: eventList ?? this.eventList,
    );
  }
}
