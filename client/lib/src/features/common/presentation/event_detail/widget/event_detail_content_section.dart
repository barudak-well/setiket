import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/constants/themes/palette.dart';
import 'package:setiket/src/features/common/presentation/event_detail/widget/widget.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class EventDetailContentSection extends ConsumerWidget {
  const EventDetailContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  onTap: () {},
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
                          horizontal: SizeApp.w20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap.h20,
              Text(
                'International Band Music Concert',
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
                  'Gala Convention Center',
                  style: TypographyApp.headline3,
                ),
                description: Text(
                  '36 Guild Street London, UK ',
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
                'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
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
                    onMin: (newQuantity) {},
                    onPlus: (newQuantity) {},
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
                    (256000).currencyFormat,
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
