import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class EventDetailContentSection extends ConsumerWidget {
  const EventDetailContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(eventDetailControllerProvider.notifier);
    final state = ref.watch(eventDetailControllerProvider);
    final detailEvent = state.event;
    return Stack(
      children: [
        Assets.images.eventDummy.image(
          width: context.screenWidthPercentage(1),
          height: context.screenHeightPercentage(.3),
          fit: BoxFit.fitWidth,
        ),
        Container(
          height: context.screenHeightPercentage(.1),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorApp.black.withOpacity(.6),
                ColorApp.black.withOpacity(0),
              ],
            ),
          ),
        ),
        PaddingWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h48,
              TopBarWidget(
                title: "Event Details",
                isDark: false,
                suffix: BookmarkWidget(
                  isBookmarked: state.isBookmarkEvent,
                  onTap: () {
                    controller.toggleBookmarkEvent(context);
                  },
                ),
              ),
              Gap.customGapHeight(context.screenHeightPercentage(.18)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeApp.w32),
                child: Container(
                  padding: EdgeInsets.all(SizeApp.w12),
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorApp.black.withOpacity(.1),
                        blurRadius: 20,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Assets.images.participantDummy.image(),
                          Gap.w12,
                          Text(
                            '+20 Going',
                            style: TypographyApp.headline3
                                .copyWith(color: ColorApp.primary),
                          ),
                        ],
                      ),
                      ButtonWidget.primary(
                        text: 'Invite',
                        isEnabled: true,
                        height: SizeApp.h36,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeApp.w16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap.h20,
              Text(
                detailEvent?.title ?? '',
                style: TypographyApp.headline1,
              ),
              Gap.h24,
              DetailRowWidget.icon(
                prefix: Assets.icons.icCalendar.svg(),
                title: Text(
                  '14 December, 2021',
                  style: TypographyApp.headline3,
                ),
                description: Text(
                  'Tuesday, 4:00PM - 9:00PM',
                  style: TypographyApp.text2.copyWith(
                    color: ColorApp.gray,
                  ),
                ),
              ),
              Gap.h16,
              DetailRowWidget.icon(
                prefix: Assets.icons.icLocation.svg(),
                title: Text(
                  detailEvent?.city ?? '',
                  style: TypographyApp.headline3,
                ),
                description: Text(
                  detailEvent?.locationDetail ?? '',
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
              Gap.h24,
              Text(
                'About Event',
                style: TypographyApp.headline3.copyWith(fontSize: 18),
              ),
              Gap.h8,
              Text(
                detailEvent?.description ?? '',
                textAlign: TextAlign.justify,
                style: TypographyApp.text2.copyWith(fontSize: 16),
              ),
              Gap.h24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ticket Price',
                    style: TypographyApp.headline1,
                  ),
                  QuantityWidget(
                    quantity: state.quantity,
                    maxQuantity: detailEvent?.remainingCapacity ?? 0,
                    onMin: (newQuantity) => controller.setQuantity(newQuantity),
                    onPlus: (newQuantity) =>
                        controller.setQuantity(newQuantity),
                  )
                ],
              ),
              Gap.h16,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: SizeApp.w56,
                    height: SizeApp.h56,
                    padding: EdgeInsets.all(9.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Palette.colorRed.shade200,
                    ),
                    child: Assets.icons.icMoney.svg(),
                  ),
                  Gap.w16,
                  Text(
                    ((state.event?.ticketPrice ?? 0) * state.quantity)
                        .currencyFormat,
                    style:
                        TypographyApp.headline1.copyWith(color: ColorApp.red),
                  ),
                ],
              ),
              Gap.customGapHeight(context.screenHeightPercentage(.15)),
            ],
          ),
        ),
      ],
    );
  }
}
