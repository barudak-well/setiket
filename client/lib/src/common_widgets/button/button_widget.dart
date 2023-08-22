// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

enum ButtonType {
  primary,
  outlined,
}

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final Function()? onTap;
  final bool isLoading;
  final Widget? prefix;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool _isEnabled;

  const ButtonWidget({
    super.key,
    required this.buttonType,
    required this.text,
    this.isLoading = false,
    this.onTap,
    this.prefix,
    this.height,
    this.padding,
    bool? isEnabled,
  }) : _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.primary({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onTap,
    this.prefix,
    this.height,
    this.padding,
    bool? isEnabled,
  })  : buttonType = ButtonType.primary,
        _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.outlined({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.prefix,
    this.height,
    this.padding,
    bool? isEnabled,
  })  : buttonType = ButtonType.outlined,
        _isEnabled = isEnabled ?? onTap != null;

  Color getColor() => _isEnabled
      ? buttonType == ButtonType.primary
          ? ColorApp.primary
          : ColorApp.black
      : ColorApp.gray;

  Color getFocusColor() =>
      buttonType == ButtonType.primary ? Palette.color.shade300 : ColorApp.gray;

  bool get isPrimary => buttonType == ButtonType.primary;
  bool get isOutlined => buttonType == ButtonType.outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: getColor(),
          border: isOutlined
              ? Border.all(
                  color: ColorApp.white,
                  width: 0.4,
                )
              : null,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Palette.color.shade200,
              blurRadius: 35,
              offset: const Offset(0, 10),
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.r),
        child: InkWell(
          onTap: _isEnabled && !isLoading ? onTap : null,
          borderRadius: BorderRadius.circular(15.r),
          overlayColor: MaterialStateProperty.all(getFocusColor()),
          focusColor: getFocusColor(),
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: SizeApp.w28,
                  vertical: SizeApp.h24,
                ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: SizeApp.customHeight(40),
                      width: SizeApp.customHeight(40),
                      child: const LoadingWidget(),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (prefix != null) ...[
                          prefix!,
                          Gap.w8,
                        ],
                        Text(
                          text,
                          style: _isEnabled
                              ? TypographyApp.headline3.white
                              : TypographyApp.headline3.grey,
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
