import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/snack_bar/snack_bar_widget.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/common/domain/domain.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/services/services.dart';

class EventDetailController extends StateNotifier<EventDetailState> {
  final CommonService _commonService;
  final HiveService _hiveService;
  EventDetailController(this._commonService, this._hiveService) : super(const EventDetailState());

  void getEventById(int id) async {
    state = state.copyWith(
      eventValue: const AsyncLoading(),
    );

    final result = await _commonService.getEventById(id);

    result.when(
      success: (data) {
        state = state.copyWith(
          quantity: 1,
          event: data,
          eventValue: AsyncData(data),
          isBookmarkEvent: _hiveService.isEventBookmark(data.id),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          eventValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void setQuantity(int quantity) {
    state = state.copyWith(quantity: quantity);
  }

  void toggleBookmarkEvent(BuildContext context) {
    if (state.isBookmarkEvent) {
      _hiveService.deleteBookmarkEvent(state.event!.id);
      appSnackBar(context, ColorApp.green, 'Event successfully removed from bookmarks');
    } else {
      _hiveService.saveBookmarkEvent(state.event!);
      appSnackBar(context, ColorApp.green, 'Event successfully bookmarked');
    }

    state = state.copyWith(
      isBookmarkEvent: _hiveService.isEventBookmark(state.event!.id),
    );
  }

  bool isBookmarkEvent(int id) {
    return _hiveService.isEventBookmark(id);
  }

  void toggleBookmarkEventById(BuildContext context, int id, Event event) {
    final isBookmark = _hiveService.isEventBookmark(id);
    if (isBookmark) {
      _hiveService.deleteBookmarkEvent(id);
      appSnackBar(context, ColorApp.green, 'Event successfully removed from bookmarks');
    } else {
      _hiveService.saveBookmarkEvent(event);
      appSnackBar(context, ColorApp.green, 'Event successfully bookmarked');
    }

    state = state.copyWith(
      isBookmarkEvent: _hiveService.isEventBookmark(id),
    );
  }
}

final eventDetailControllerProvider = StateNotifierProvider<EventDetailController, EventDetailState>((ref) {
  final hiveService = ref.read(hiveServiceProvider);
  final commonService = ref.read(commonServiceProvider);
  return EventDetailController(commonService, hiveService);
});
