import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/features/common/domain/home.dart';
import 'package:setiket/src/features/common/presentation/home/home_page.dart';

class HomeState {
  final bool isHomeActive;
  final bool isExploreActive;
  final bool isEventsActive;
  final bool isProfileActive;
  final int currentIndex;
  final Widget currentScreen;
  final AsyncValue<Home?> homeValue;
  final Home? home;

  HomeState({
    this.isHomeActive = true,
    this.isExploreActive = false,
    this.isEventsActive = false,
    this.isProfileActive = false,
    this.currentIndex = 0,
    this.currentScreen = const HomePage(),
    this.homeValue = const AsyncLoading(),
    this.home,
  });

  HomeState copyWith({
    bool? isHomeActive,
    bool? isExploreActive,
    bool? isEventsActive,
    bool? isProfileActive,
    int? currentIndex,
    Widget? currentScreen,
    AsyncValue<Home?>? homeValue,
    Home? home,
  }) {
    return HomeState(
      isHomeActive: isHomeActive ?? this.isHomeActive,
      isExploreActive: isExploreActive ?? this.isExploreActive,
      isEventsActive: isEventsActive ?? this.isEventsActive,
      isProfileActive: isProfileActive ?? this.isProfileActive,
      currentIndex: currentIndex ?? this.currentIndex,
      currentScreen: currentScreen ?? this.currentScreen,
      homeValue: homeValue ?? this.homeValue,
      home: home ?? this.home,
    );
  }
}
