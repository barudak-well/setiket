import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/domain.dart';

class MyEventsState {
  final bool isUpcomingEventsActive;
  final bool isPastEventsActive;
  final AsyncValue<List<Ticket>> upcomingEventsValue;
  final AsyncValue<List<Ticket>> pastEventsValue;
  final List<Ticket> upcomingEvents;
  final List<Ticket> pastEvents;
  const MyEventsState({
    this.isUpcomingEventsActive = true,
    this.isPastEventsActive = false,
    this.upcomingEventsValue = const AsyncData([]),
    this.pastEventsValue = const AsyncData([]),
    this.upcomingEvents = const [],
    this.pastEvents = const [],
  });

  bool get isEventListLoading => upcomingEventsValue.isLoading;

  MyEventsState copyWith({
    bool? isUpcomingEventsActive,
    bool? isPastEventsActive,
    AsyncValue<List<Ticket>>? upcomingEventsValue,
    AsyncValue<List<Ticket>>? pastEventsValue,
    List<Ticket>? upcomingEvents,
    List<Ticket>? pastEvents,
  }) {
    return MyEventsState(
      isUpcomingEventsActive:
          isUpcomingEventsActive ?? this.isUpcomingEventsActive,
      isPastEventsActive: isPastEventsActive ?? this.isPastEventsActive,
      upcomingEventsValue: upcomingEventsValue ?? this.upcomingEventsValue,
      pastEventsValue: pastEventsValue ?? this.pastEventsValue,
      upcomingEvents: upcomingEvents ?? this.upcomingEvents,
      pastEvents: pastEvents ?? this.pastEvents,
    );
  }
}
