import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';

class ButtonQuantityWidget extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const ButtonQuantityWidget({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeApp.w40,
      height: SizeApp.h40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 1, color: Palette.colorGray.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: child,
          ),
        ),
      ),
    );
  }
}
