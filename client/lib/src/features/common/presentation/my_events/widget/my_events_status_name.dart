import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';

class MyEventsStatusName extends StatelessWidget {
  final String name;
  final bool isActive;
  final Function() onTap;
  const MyEventsStatusName({
    super.key,
    required this.name,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.w28,
            vertical: SizeApp.w4,
          ),
          decoration: BoxDecoration(
            color: isActive ? ColorApp.white : Colors.transparent,
            borderRadius: BorderRadius.circular(100.r),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                      color: ColorApp.black.withOpacity(.1),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              name,
              style: TypographyApp.text1.copyWith(
                color: isActive ? ColorApp.primary : ColorApp.gray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
