import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/routes/app_routes.dart';
import 'package:setiket/src/routes/extras.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class EventCardWidget extends StatelessWidget {
  final Event event;
  const EventCardWidget({
    required this.event,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        Routes.eventDetail.name,
        extra: Extras(
          datas: {
            ExtrasKey.id: event.id,
          },
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h, right: 20.w),
        decoration: BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          boxShadow: [
            BoxShadow(
              color: Palette.colorGray.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: event.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                    width: context.screenWidthPercentage(0.55),
                    height: context.screenHeightPercentage(0.2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                        bottomLeft: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10.h,
                          left: 10.w,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: Palette.colorWhite.withOpacity(0.8),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    event.startDatetime.day.toString(),
                                    style: TypographyApp.headline3.copyWith(
                                      color: ColorApp.red,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    event.startDatetime.monthName.toUpperCase(),
                                    style: TypographyApp.headline3.copyWith(
                                      color: ColorApp.red,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Positioned(
                          top: 10.h,
                          right: 10.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: Palette.colorWhite.withOpacity(0.8),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.r),
                              ),
                            ),
                            child: const Icon(
                              Icons.bookmark,
                              color: ColorApp.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    )),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h12,
                  SizedBox(
                    width: context.screenWidthPercentage(0.44),
                    child: Text(
                      event.title,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyApp.headline2.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gap.h8,
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Palette.colorGray,
                        size: 18,
                      ),
                      Gap.w4,
                      SizedBox(
                        width: context.screenWidthPercentage(0.44),
                        child: Text(
                          '${event.startDatetime.time} - ${event.endDatetime.time}',
                          style: TypographyApp.headline3.copyWith(
                            color: Palette.colorGray.withOpacity(0.7),
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap.h8,
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Palette.colorGray,
                        size: 18,
                      ),
                      Gap.w4,
                      SizedBox(
                        width: context.screenWidthPercentage(0.44),
                        child: Text(
                          event.startDatetime.dateMonthYear,
                          style: TypographyApp.headline3.copyWith(
                            color: Palette.colorGray.withOpacity(0.7),
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap.h8,
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Palette.colorGray,
                        size: 18,
                      ),
                      Gap.w4,
                      SizedBox(
                        width: context.screenWidthPercentage(0.4),
                        child: Text(
                          event.city.name.toUpperCase(),
                          style: TypographyApp.headline3.copyWith(
                            color: Palette.colorGray.withOpacity(0.7),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
