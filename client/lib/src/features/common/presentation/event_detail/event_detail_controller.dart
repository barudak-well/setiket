import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/snack_bar/snack_bar_widget.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/domain/event.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/services/services.dart';

class EventDetailController extends StateNotifier<EventDetailState> {
  final HiveService _hiveService;
  EventDetailController(this._hiveService) : super(const EventDetailState());

  void setEvent(Event event) {
    state = state.copyWith(
      event: event,
      eventValue: AsyncData(event),
      isBookmarkEvent: _hiveService.isEventBookmark(event.id),
    );
  }

  void setQuantity(int quantity) {
    state = state.copyWith(quantity: quantity);
  }

  void toggleBookmarkEvent(BuildContext context) {
    if (state.isBookmarkEvent) {
      _hiveService.deleteBookmarkEvent(state.event!.id);
      appSnackBar(
          context, ColorApp.green, 'Event successfully removed from bookmarks');
    } else {
      _hiveService.saveBookmarkEvent(state.event!);
      appSnackBar(context, ColorApp.green, 'Event successfully bookmarked');
    }

    state = state.copyWith(
      isBookmarkEvent: _hiveService.isEventBookmark(state.event!.id),
    );
  }
}

final eventDetailControllerProvider =
    StateNotifierProvider<EventDetailController, EventDetailState>((ref) {
  final hiveService = ref.read(hiveServiceProvider);
  return EventDetailController(hiveService);
});
