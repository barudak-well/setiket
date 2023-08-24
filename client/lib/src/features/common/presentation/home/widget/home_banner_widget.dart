import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidthPercentage(1),
          height: context.screenHeightPercentage(.3),
          decoration: BoxDecoration(
            color: Palette.color[900],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(33.r),
              bottomRight: Radius.circular(33.r),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.h36,
            PaddingWidget(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap.w48,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Current Location',
                                style: TypographyApp.headline3.copyWith(
                                  color: ColorApp.white.withOpacity(0.7),
                                  fontSize: 16.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorApp.white.withOpacity(0.7),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeApp.w40,
                            ),
                            child: Text(
                              'Bandung',
                              style: TypographyApp.text2.copyWith(
                                color: ColorApp.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: SizeApp.w40,
                            height: SizeApp.h40,
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.r),
                              ),
                              color: Palette.colorWhite.withOpacity(0.2),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: Icon(
                                    Icons.notifications_none,
                                    color: ColorApp.white,
                                    size: SizeApp.h28,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 3,
                                      right: 5,
                                    ),
                                    child: Container(
                                      width: 10.w,
                                      height: 10.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30.r),
                                        ),
                                        color: ColorApp.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                  Gap.h40,
                  Row(
                    children: [
                      Container(
                        width: context.screenWidthPercentage(0.75),
                        height: SizeApp.h48,
                        padding: EdgeInsets.only(
                          left: 12.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.r),
                          ),
                          color: Palette.colorWhite.withOpacity(0.2),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 1),
                              child: Icon(
                                Icons.search,
                                color: ColorApp.white,
                                size: SizeApp.h36,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Search...',
                                style: TypographyApp.headline3.copyWith(
                                  color: ColorApp.white.withOpacity(0.5),
                                  fontSize: 24.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap.w12,
                      Container(
                          width: SizeApp.w40,
                          height: SizeApp.h40,
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.r),
                            ),
                            color: Palette.colorWhite.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1),
                            child: Icon(
                              Icons.filter_list,
                              color: ColorApp.white,
                              size: SizeApp.h28,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Gap.customGapHeight(context.screenHeightPercentage(.07)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Gap.w24,
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.sports_basketball,
                            color: ColorApp.white,
                            size: 24,
                          ),
                          Gap.w4,
                          Text('Sports', style: TypographyApp.headline3.white),
                        ],
                      )),
                  Gap.w12,
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.headset,
                            color: ColorApp.white,
                            size: 24,
                          ),
                          Gap.w4,
                          Text('Music', style: TypographyApp.headline3.white),
                        ],
                      )),
                  Gap.w12,
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[400],
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.fastfood_rounded,
                            color: ColorApp.white,
                            size: 24,
                          ),
                          Gap.w4,
                          Text('Food', style: TypographyApp.headline3.white),
                        ],
                      )),
                  Gap.w12,
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.computer,
                            color: ColorApp.white,
                            size: 24,
                          ),
                          Gap.w4,
                          Text('Tech', style: TypographyApp.headline3.white),
                        ],
                      )),
                  Gap.w12,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
