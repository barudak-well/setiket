import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/presentation.dart';

class HomeBotNavBarScreen extends ConsumerWidget {
  const HomeBotNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeControllerProvider.notifier);
    final state = ref.watch(homeControllerProvider);
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
                icon: !state.isHomeActive ? Assets.icons.icHomeDeactive.svg() : Assets.icons.icHomeActive.svg(),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: !state.isExploreActive ? Assets.icons.icExploreDeactive.svg() : Assets.icons.icExploreActive.svg(),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: !state.isEventsActive ? Assets.icons.icEventsDeactive.svg() : Assets.icons.icEventsActive.svg(),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: !state.isProfileActive ? Assets.icons.icProfileDeactive.svg() : Assets.icons.icProfileActive.svg(),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
