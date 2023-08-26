import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/common/presentation/my_events/my_events_state.dart';

class MyEventsController extends StateNotifier<MyEventsState> {
  final CommonService _commonService;
  MyEventsController(this._commonService) : super(const MyEventsState()) {
    getMyEvents();
  }

  void getMyEvents() async {
    state = state.copyWith(
      upcomingEventsValue: const AsyncLoading(),
      pastEventsValue: const AsyncLoading(),
    );

    final result = await _commonService.getMyEvents();

    result.when(
      success: (data) {
        state = state.copyWith(
          upcomingEventsValue: AsyncData(data.upcomingEvents),
          pastEventsValue: AsyncData(data.pastEvents),
          upcomingEvents: data.upcomingEvents,
          pastEvents: data.pastEvents,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          upcomingEventsValue: AsyncError(error, stackTrace),
          pastEventsValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void setUpcoming(bool isUpcoming) {
    state = state.copyWith(
        isUpcomingEventsActive: isUpcoming, isPastEventsActive: !isUpcoming);
  }
}

final myEventsControllerProvider =
    StateNotifierProvider<MyEventsController, MyEventsState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return MyEventsController(commonService);
});
