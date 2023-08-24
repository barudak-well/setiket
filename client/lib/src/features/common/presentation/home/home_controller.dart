import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/jailbreak/presentation/jailbreak_page.dart';
import 'package:setiket/src/features/presentation.dart';

class HomeController extends StateNotifier<HomeState> {
  final CommonService _commonService;

  HomeController(
    this._commonService,
  ) : super(HomeState()) {
    fetchHome();
  }

  void fetchHome() async {
    state = state.copyWith(
      homeValue: const AsyncLoading(),
    );
    final result = await _commonService.fetchHome();
    result.when(
      success: (data) {
        state = state.copyWith(
          home: data,
          homeValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          homeValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void setPage(index) {
    state = state.copyWith(
      currentIndex: index,
      currentScreen: _getScreen(index),
      isHomeActive: index == 0,
      isExploreActive: index == 1,
      isEventsActive: index == 2,
      isProfileActive: index == 3,
    );
  }

  Widget _getScreen(index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const JailbreakPage();
      case 2:
        return const HomePage();
      case 3:
        return const JailbreakPage();
      default:
        return const HomePage();
    }
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return HomeController(commonService);
});
