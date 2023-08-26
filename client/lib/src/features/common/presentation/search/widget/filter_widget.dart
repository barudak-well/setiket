import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/features/common/data/responses/event_response.dart';
import 'package:setiket/src/features/common/presentation/search/search_controller.dart';
import 'package:setiket/src/features/common/presentation/search/widget/category_widget.dart';
import 'package:setiket/src/features/common/presentation/search/widget/filter_chip_date_widget.dart';
import 'package:setiket/src/features/common/presentation/search/widget/filter_chip_location_widget.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class FilterWidget extends ConsumerWidget {
  final ScrollController scrollController;
  const FilterWidget({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchControllerProvider);
    final controller = ref.read(searchControllerProvider.notifier);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeApp.w20),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.h20,
            Center(
              child: Container(
                width: 50.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Palette.colorGray.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Gap.h20,
            Text(
              'Filter',
              style: TypographyApp.headline1,
            ),
            Gap.h24,
            SizedBox(
              height: 170.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: CategoryEvent.values.length,
                itemBuilder: (context, index) => CategoryWidget(index: index),
              ),
            ),
            Text(
              'Time & Date',
              style: TypographyApp.headline3.fontSizeCustom(24.sp),
            ),
            Gap.h12,
            Row(
              children: [
                const FilterChipDateWidget(name: 'TODAY'),
                Gap.w16,
                const FilterChipDateWidget(name: 'TOMORROW'),
                Gap.w16,
                const FilterChipDateWidget(name: 'THIS WEEK'),
              ],
            ),
            Gap.h12,
            InkWell(
              onTap: () async {
                final result = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                  initialDateRange: DateTimeRange(
                    start: DateTime.now(),
                    end: DateTime.now().add(
                      const Duration(days: 7),
                    ),
                  ),
                );
                if (result != null) controller.setPickDateFilter(result.start.toYyyyMMDd, result.end.toYyyyMMDd);
              },
              child: state.startDateFilter != '' &&
                      state.startDateFilter != 'TODAY' &&
                      state.startDateFilter != 'TOMORROW' &&
                      state.startDateFilter != 'THIS WEEK' &&
                      state.startDateFilter != null
                  ? Container(
                      width: 200.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Palette.color,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Palette.colorWhite,
                            size: 20,
                          ),
                          Gap.w8,
                          Text(
                            'Choose from Calendar',
                            style: TypographyApp.text2.white,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: 200.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Palette.colorWhite,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Palette.colorGray.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Palette.color,
                            size: 20,
                          ),
                          Gap.w8,
                          Text(
                            'Choose from Calendar',
                            style: TypographyApp.text2.grey,
                          ),
                        ],
                      ),
                    ),
            ),
            Gap.h36,
            Text(
              'Location',
              style: TypographyApp.headline3.fontSizeCustom(24.sp),
            ),
            Gap.h12,
            SizedBox(
              height: 120.h,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 10,
                ),
                itemCount: CityEvent.values.length,
                itemBuilder: (context, index) => FilterChipLocationWidget(
                  value: CityEvent.values[index],
                ), // CityEvent.values[index].value.capitalize
              ),
            ),
            Gap.h32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  height: SizeApp.h56,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.clearFilter();
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.colorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'RESET',
                      style: TypographyApp.text1,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: SizeApp.h56,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.getSearchByFilter();
                      controller.clearSearch();
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'APPLY',
                      style: TypographyApp.text1.white,
                    ),
                  ),
                ),
              ],
            ),
            Gap.h24
          ],
        ),
      ),
    );
  }
}
