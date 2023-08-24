import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/presentation/my_events/widget/widget.dart';

class MyEventsStatus extends ConsumerWidget {
  const MyEventsStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeApp.w16),
      child: Container(
        height: SizeApp.h56,
        padding: EdgeInsets.all(SizeApp.w8),
        decoration: BoxDecoration(
          color: ColorApp.black.withOpacity(.05),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            MyEventsStatusName(
              name: 'UPCOMING',
              isActive: true,
              onTap: () {},
            ),
            Gap.w4,
            MyEventsStatusName(
              name: 'PAST EVENTS',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
