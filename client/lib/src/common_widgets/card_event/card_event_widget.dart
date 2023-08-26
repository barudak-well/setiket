import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class CardEventWidget extends StatelessWidget {
  final Event event;
  const CardEventWidget(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeApp.w8),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              blurRadius: 35,
              offset: const Offset(0, 10),
              color: ColorApp.primary.withOpacity(.06))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: event.imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              width: 79,
              height: 92,
              decoration: BoxDecoration(
                color: ColorApp.gray,
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Gap.w16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.startDatetime.dateMonthTime,
                  style: TypographyApp.text2.semiBold
                      .copyWith(color: ColorApp.primary),
                ),
                Gap.h8,
                Text(
                  event.title,
                  style: TypographyApp.text1,
                ),
                Gap.h8,
                Row(
                  children: [
                    Icon(Icons.location_on_rounded,
                        color: Palette.colorGray.shade300),
                    Gap.w4,
                    Text(
                      event.locationDetail,
                      style: TypographyApp.text2.medium
                          .copyWith(color: ColorApp.gray),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
