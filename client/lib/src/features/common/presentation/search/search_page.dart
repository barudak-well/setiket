import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/presentation/search/search_controller.dart';
import 'package:setiket/src/features/common/presentation/search/widget/search_field_widget.dart';
import 'package:setiket/src/features/common/presentation/search/widget/search_list_widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(searchControllerProvider.notifier);
    final state = ref.watch(searchControllerProvider);
    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: SizeApp.w20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h64,
              Text(
                'Explore Events',
                style: TypographyApp.headline1,
              ),
              Gap.h20,
              SearchFieldWidget(
                hintText: 'Search...',
                onChanged: (value) {
                  if (value == '') controller.getEvent();
                  if (value.isNotEmpty) controller.getSearch(value);
                  controller.setSearch(value);
                },
              ),
              Gap.h12,
              Visibility(
                visible: state.query != '',
                child: Text(
                  'Results for "${state.query}"',
                  style: TypographyApp.headline3,
                ),
              ),
              const SearchListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
