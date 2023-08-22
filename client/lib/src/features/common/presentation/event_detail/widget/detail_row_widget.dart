import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';

enum DetailRowType {
  icon,
  image,
}

class DetailRowWidget extends StatelessWidget {
  final Widget prefix;
  final Widget title;
  final Widget description;
  final DetailRowType detailRowType;

  const DetailRowWidget({
    super.key,
    required this.prefix,
    required this.title,
    required this.description,
    required this.detailRowType,
  });

  const DetailRowWidget.icon({
    super.key,
    required this.prefix,
    required this.title,
    required this.description,
  }) : detailRowType = DetailRowType.icon;

  const DetailRowWidget.image({
    super.key,
    required this.prefix,
    required this.title,
    required this.description,
  }) : detailRowType = DetailRowType.image;

  Widget getPrefix() => Container(
        width: SizeApp.w56,
        height: SizeApp.h56,
        padding: detailRowType == DetailRowType.icon
            ? EdgeInsets.all(9.r)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Palette.color.shade50,
        ),
        child: detailRowType == DetailRowType.icon
            ? prefix
            : ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: prefix,
              ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getPrefix(),
        Gap.w12,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            description,
          ],
        )
      ],
    );
  }
}
