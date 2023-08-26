import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class HomeBotNavBarScreen extends ConsumerStatefulWidget {
  const HomeBotNavBarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeBotNavBarScreenState();
}

class _HomeBotNavBarScreenState extends ConsumerState<HomeBotNavBarScreen> {
  HomeController get controller => ref.read(homeControllerProvider.notifier);
  HomeState get state => ref.watch(homeControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getProfile();
      controller.setPage(0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = state.currentIndex;
    final currentScreen = state.currentScreen;
    final bucket = PageStorageBucket();

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10.sp),
          decoration: const BoxDecoration(color: ColorApp.white),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 24.0.sp,
            currentIndex: currentIndex,
            onTap: (index) => controller.setPage(index),
            items: [
              BottomNavigationBarItem(
                icon: !state.isHomeActive
                    ? Assets.icons.icHomeDeactive.svg()
                    : Assets.icons.icHomeActive.svg(),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: !state.isExploreActive
                    ? Assets.icons.icExploreDeactive.svg()
                    : Assets.icons.icExploreActive.svg(),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: !state.isEventsActive
                    ? Assets.icons.icEventsDeactive.svg()
                    : Assets.icons.icEventsActive.svg(),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: !state.isProfileActive
                    ? Assets.icons.icProfileDeactive.svg()
                    : Assets.icons.icProfileActive.svg(),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
