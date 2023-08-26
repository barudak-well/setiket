import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/features/application.dart';
import 'package:setiket/src/features/common/presentation/search/search_page.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/routes/app_routes.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

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

  void getProfile() async {
    state = state.copyWith(
      userValue: const AsyncLoading(),
    );
    final result = await _commonService.getProfile();
    result.when(
      success: (data) {
        state = state.copyWith(
          user: data,
          userValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          userValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void logout() {
    setPage(0);
    _commonService.logout();
    state = state.copyWith(
      user: null,
      userValue: const AsyncData(null),
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
        return const SearchPage();
      case 2:
        if (checkUser()) {
          return const MyEventsPage();
        } else {
          return const HomePage();
        }
      case 3:
        if (checkUser()) {
          return const ProfilePage();
        } else {
          return const HomePage();
        }
      default:
        return const HomePage();
    }
  }

  bool checkUser() {
    if (state.userValue.hasError || state.userValue.value.isNull()) {
      navigatorKey.currentContext!.goNamed(Routes.login.name);
      return false;
    }

    return true;
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return HomeController(commonService);
});
