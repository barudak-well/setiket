import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/features/common/presentation/search/widget/filter_widget.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class SearchFieldWidget extends ConsumerWidget {
  final String hintText;
  final Function(String value) onChanged;
  final bool autofocus;
  const SearchFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          width: context.screenWidthPercentage(0.75),
          height: SizeApp.h48,
          child: TextField(
            autofocus: autofocus,
            decoration: InputDecoration(
              fillColor: ColorApp.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeApp.w20),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.none,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: ColorApp.gray,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: SizeApp.w16, vertical: SizeApp.h12),
              hintText: hintText,
              hintStyle: TypographyApp.text2.grey,
            ),
            onChanged: onChanged,
          ),
        ),
        Gap.w12,
        InkWell(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              isScrollControlled: true,
              isDismissible: true,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.73,
                  maxChildSize: 0.73,
                  minChildSize: 0.73,
                  expand: true,
                  builder: (context, scrollController) {
                    return FilterWidget(scrollController: scrollController);
                  },
                );
              },
            );
          },
          child: Container(
            width: SizeApp.w40,
            height: SizeApp.h40,
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30.r),
              ),
              color: Palette.color,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Icon(
                Icons.filter_list,
                color: ColorApp.white,
                size: SizeApp.h28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
