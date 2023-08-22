import 'package:flutter/material.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/presentation/event_detail/widget/widget.dart';

class QuantityWidget extends StatelessWidget {
  final int quantity;
  final int maxQuantity;
  final Function(int) onMin;
  final Function(int) onPlus;
  const QuantityWidget({
    super.key,
    required this.onMin,
    required this.onPlus,
    this.quantity = 1,
    this.maxQuantity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonQuantityWidget(
          onTap: () {
            if (quantity > 1) onMin(quantity - 1);
          },
          child: Assets.icons.icMin.svg(),
        ),
        Gap.w20,
        Text('$quantity', style: TypographyApp.headline3),
        Gap.w20,
        ButtonQuantityWidget(
          onTap: () {
            if (quantity < maxQuantity) onPlus(quantity + 1);
          },
          child: Assets.icons.icPlus.svg(),
        ),
      ],
    );
  }
}
