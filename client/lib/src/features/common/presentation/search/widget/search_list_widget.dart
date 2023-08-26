import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/features/common/presentation/search/search_controller.dart';
import 'package:setiket/src/features/common/presentation/search/widget/search_event_card_widget.dart';

class SearchListWidget extends ConsumerWidget {
  const SearchListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchControllerProvider);
    return AsyncValueWidget(
      value: state.eventValue,
      data: (value) {
        return value!.isNotEmpty
            ? ListView.builder(
                itemCount: value.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final event = value[index];
                  return SearchEventCardWidget(event: event);
                },
              )
            : Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 250.h),
                  child: const Text('Event Not Found'),
                ),
              );
      },
    );
  }
}
