import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/domain.dart';

class ProfileState {
  final List<Event> bookmarkEventList;
  final AsyncValue<List<Event>> bookmarkEventListValue;

  const ProfileState({
    this.bookmarkEventList = const [],
    this.bookmarkEventListValue = const AsyncLoading(),
  });

  bool get isLoading => bookmarkEventListValue.isLoading;

  ProfileState copyWith({
    List<Event>? bookmarkEventList,
    AsyncValue<List<Event>>? bookmarkEventListValue,
  }) {
    return ProfileState(
      bookmarkEventList: bookmarkEventList ?? this.bookmarkEventList,
      bookmarkEventListValue:
          bookmarkEventListValue ?? this.bookmarkEventListValue,
    );
  }
}
