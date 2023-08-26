import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/presentation/profile/widget/widget.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StatusBarWidget(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: PaddingWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap.h48,
                    const ProfileTopBar(),
                    Gap.h28,
                    const ProfileContentSection(),
                    Gap.h28,
                    Text(
                      'Bookmark Events',
                      style: TypographyApp.headline2,
                    ),
                    Gap.h12,
                    const ProfileBookmark(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
