import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/gen/assets.gen.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class ProfileContentSection extends ConsumerWidget {
  const ProfileContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Container(
            width: SizeApp.w96,
            height: SizeApp.h96,
            decoration: BoxDecoration(
              color: ColorApp.gray,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Assets.images.eoDummy.provider(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap.h16,
          Text(
            'Ashfak Sayem',
            textAlign: TextAlign.center,
            style: TypographyApp.text1.copyWith(fontSize: 24),
          ),
          Gap.h16,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenHeightPercentage(.125),
            ),
            child: ButtonWidget.primary(
              text: 'Keluar',
              isEnabled: true,
              height: SizeApp.h64,
              color: ColorApp.red,
              onTap: () {},
              padding: EdgeInsets.symmetric(
                horizontal: SizeApp.w16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
