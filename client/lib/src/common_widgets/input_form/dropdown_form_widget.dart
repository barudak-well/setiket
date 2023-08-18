import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class DropdownFormWidget extends StatelessWidget {
  final String value;
  final List<Map<String, String>> list;
  final Function(String? value) onChanged;
  final IconData? prefixIcon;
  final String? errorText;

  const DropdownFormWidget({
    super.key,
    required this.value,
    required this.prefixIcon,
    required this.onChanged,
    required this.list,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeApp.h72,
      child: InputDecorator(
        decoration: InputDecoration(
          errorText: errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Palette.colorGray.shade200,
              width: 1.w,
            ),
          ),
          prefixIcon: prefixIcon.isNotNull() ? Icon(prefixIcon) : null,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 26,
              color: Colors.grey.shade400,
            ),
            style: TypographyApp.text1,
            isExpanded: true,
            borderRadius: BorderRadius.circular(12.r),
            onChanged: (String? newValue) {
              onChanged(newValue);
            },
            items: list.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value['value'],
                child: Text(value['text'] ?? value['value']!),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
