import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class FilterWidget extends StatelessWidget {
  final ScrollController scrollController;
  const FilterWidget({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
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
            // divider line
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
            Gap.h20,
            Text(
              'Category',
              style: TypographyApp.headline3,
            ),
            Gap.h12,
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                FilterChip(
                  label: Text(
                    'Music',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Sport',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Seminar',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Festival',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Expo',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Others',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
              ],
            ),
            Gap.h20,
            Text(
              'Location',
              style: TypographyApp.headline3,
            ),
            Gap.h12,
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                FilterChip(
                  label: Text(
                    'Jakarta',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Bandung',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Surabaya',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Yogyakarta',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
              ],
            ),
            Gap.h20,
            Text(
              'Date',
              style: TypographyApp.headline3,
            ),
            Gap.h12,
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                FilterChip(
                  label: Text(
                    'Today',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: Text(
                    'Tomorrow',
                    style: TypographyApp.text2,
                  ),
                  selected: false,
                  onSelected: (bool value) {},
                ),
              ],
            ),

            Gap.h56,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: SizeApp.h40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Apply',
                      style: TypographyApp.text1.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: SizeApp.h40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.colorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Reset',
                      style: TypographyApp.text1,
                    ),
                  ),
                ),
              ],
            ),
            Gap.h20,
          ],
        ),
      ),
    );
  }
}
