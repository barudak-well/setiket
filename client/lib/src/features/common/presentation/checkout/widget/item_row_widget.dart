import 'package:flutter/widgets.dart';
import 'package:setiket/src/constants/themes/themes.dart';

enum ItemRowype {
  heading,
  subHeading,
}

class ItemRowWidget extends StatelessWidget {
  final String title;
  final String value;
  final ItemRowype itemRowype;

  const ItemRowWidget({
    super.key,
    required this.title,
    required this.value,
    required this.itemRowype,
  });

  const ItemRowWidget.heading({
    super.key,
    required this.title,
    required this.value,
  }) : itemRowype = ItemRowype.heading;

  const ItemRowWidget.subHeading({
    super.key,
    required this.title,
    required this.value,
  }) : itemRowype = ItemRowype.subHeading;

  TextStyle getTextStyle() => itemRowype == ItemRowype.heading
      ? TypographyApp.headline2
      : TypographyApp.headline3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: getTextStyle()),
        Text(
          value,
          textAlign: TextAlign.right,
          style: getTextStyle().copyWith(color: ColorApp.red),
        )
      ],
    );
  }
}
