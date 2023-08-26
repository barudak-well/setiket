import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/features/common/data/responses/event_response.dart';
import 'package:setiket/src/features/common/presentation/search/search_controller.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class CategoryWidget extends ConsumerWidget {
  final int index;
  const CategoryWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchControllerProvider);
    final controller = ref.read(searchControllerProvider.notifier);
    return Container(
      margin: EdgeInsets.only(right: SizeApp.w24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => CategoryEvent.values[index].value == state.categoryFilter
                ? controller.setCategoryFilter('')
                : controller.setCategoryFilter(CategoryEvent.values[index].value),
            child: Container(
              width: 84.w,
              height: 84.h,
              decoration: BoxDecoration(
                color: state.categoryFilter == CategoryEvent.values[index].value.toUpperCase()
                    ? Palette.color
                    : Palette.colorGray.withOpacity(0.2),
                shape: BoxShape.circle,
                boxShadow: state.categoryFilter == CategoryEvent.values[index].value.toUpperCase()
                    ? [BoxShadow(blurRadius: 35, offset: const Offset(0, 10), color: ColorApp.primary.withOpacity(.2))]
                    : [],
              ),
              child: Icon(CategoryEvent.values[index].value.filterIcon, color: Palette.colorWhite, size: 50),
            ),
          ),
          Gap.h12,
          Text(
            CategoryEvent.values[index].value.capitalize,
            style: TypographyApp.headline3.copyWith(
              fontSize: 20.sp,
            ),
          )
        ],
      ),
    );
  }
}
