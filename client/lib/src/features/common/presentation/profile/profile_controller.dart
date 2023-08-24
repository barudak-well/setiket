import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/services/services.dart';

class ProfileController extends StateNotifier<ProfileState> {
  final HiveService _hiveService;
  ProfileController(
    this._hiveService,
  ) : super(const ProfileState());

  void getBookmarkEvents() async {
    state = state.copyWith(
      bookmarkEventListValue: const AsyncLoading(),
    );

    final result = _hiveService.getAllBookmarkEvents();
    log(result.toString());
    result.when(
      success: (data) {
        state = state.copyWith(
          bookmarkEventList: data,
          bookmarkEventListValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          bookmarkEventListValue: AsyncError(error, stackTrace),
        );
      },
    );
  }
}

final profileControllerProvider =
    StateNotifierProvider<ProfileController, ProfileState>((ref) {
  final hiveService = ref.read(hiveServiceProvider);
  return ProfileController(hiveService);
});
