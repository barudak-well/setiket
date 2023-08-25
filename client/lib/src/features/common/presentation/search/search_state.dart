import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/event.dart';

class SearchState {
  final AsyncValue<List<Event>?> eventValue;
  final List<Event>? event;
  final String query;

  const SearchState({
    this.eventValue = const AsyncLoading(),
    this.event,
    this.query = '',
  });

  SearchState copyWith({
    AsyncValue<List<Event>?>? eventValue,
    List<Event>? event,
    String? query,
  }) {
    return SearchState(
      eventValue: eventValue ?? this.eventValue,
      event: event ?? this.event,
      query: query ?? this.query,
    );
  }
}
