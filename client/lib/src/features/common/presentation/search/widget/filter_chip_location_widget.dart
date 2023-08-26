import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/features/common/presentation/search/search_controller.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class FilterChipLocationWidget extends ConsumerWidget {
  final Enum value;
  const FilterChipLocationWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchControllerProvider);
    final controller = ref.read(searchControllerProvider.notifier);
    return FilterChip(
      label: Text(
        value.name == 'other' ? 'Others' : value.name.capitalize,
        style: state.locationFilter == value.name.toUpperCase() ? TypographyApp.text1.white : TypographyApp.text1.grey,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: state.locationFilter == value.name.toUpperCase()
              ? Palette.colorGray.withOpacity(0)
              : Palette.colorGray.withOpacity(0.2),
        ),
      ),
      backgroundColor: Palette.colorWhite,
      selectedColor: Palette.color,
      selectedShadowColor: Palette.color.withOpacity(0.2),
      labelStyle: TypographyApp.text2,
      checkmarkColor: Palette.colorWhite,
      selected: state.locationFilter == value.name.toUpperCase(),
      onSelected: (bool value) {
        controller.setLocationFilter(value ? this.value.name : '');
      },
    );
  }
}
