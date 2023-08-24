import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/presentation/checkout/checkout_controller.dart';
import 'package:setiket/src/features/common/presentation/checkout/widget/widget.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class CheckoutContentSection extends ConsumerWidget {
  const CheckoutContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutControllerProvider);
    final detailTicket = state.ticket!;
    final detailEvent = detailTicket.event;
    return PaddingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap.h48,
          const TopBarWidget(title: "Checkout"),
          Gap.h32,
          CardEventWidget(detailTicket.event),
          Gap.h20,
          Text('Ticket Details', style: TypographyApp.headline1),
          Gap.h16,
          DetailRowWidget.icon(
            prefix: Assets.icons.icCalendar.svg(),
            title: Text(
              detailEvent.startDatetime.dateMonthYear,
              style: TypographyApp.headline3,
            ),
            description: Text(
              '${detailEvent.startDatetime.dayName}, ${detailEvent.startDatetime.time} - ${detailEvent.endDatetime.time}',
              style: TypographyApp.text2.copyWith(
                color: ColorApp.gray,
              ),
            ),
          ),
          Gap.h16,
          DetailRowWidget.icon(
            prefix: Assets.icons.icLocation.svg(),
            title: Text(
              detailEvent.city.value.capitalize,
              style: TypographyApp.headline3,
            ),
            description: Text(
              detailEvent.locationDetail,
              style: TypographyApp.text2.copyWith(
                color: ColorApp.gray,
              ),
            ),
          ),
          Gap.h16,
          DetailRowWidget.image(
            prefix: Assets.images.eoDummy.image(fit: BoxFit.cover),
            title: Text(
              'Ashfak Sayem',
              style: TypographyApp.headline3.bold,
            ),
            description: Text(
              'Organizer',
              style: TypographyApp.text2.copyWith(
                color: ColorApp.gray,
              ),
            ),
          ),
          Gap.h32,
          Text('Summary', style: TypographyApp.headline1),
          Gap.h16,
          ItemRowWidget.subHeading(
            title: 'Sub-total',
            value:
                '${detailEvent.ticketPrice.currency} x ${detailTicket.quantity}',
          ),
          Gap.h8,
          const ItemRowWidget.subHeading(title: 'Tax', value: 'Rp10.000'),
          Gap.h8,
          ItemRowWidget.heading(
              title: 'Total', value: detailTicket.price.currency),
          Gap.customGapHeight(context.screenHeightPercentage(.15)),
        ],
      ),
    );
  }
}
