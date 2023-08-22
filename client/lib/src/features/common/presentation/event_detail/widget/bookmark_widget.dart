import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';

class BookmarkWidget extends StatelessWidget {
  final bool isBookmarked;
  final Function() onTap;
  const BookmarkWidget({
    super.key,
    required this.onTap,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeApp.customHeight(40),
        width: SizeApp.customHeight(40),
        decoration: BoxDecoration(
          color: ColorApp.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
          color: ColorApp.white,
        ),
      ),
    );
  }
}
