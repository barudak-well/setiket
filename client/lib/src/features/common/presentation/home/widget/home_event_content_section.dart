import 'package:flutter/material.dart';
import 'package:setiket/src/features/common/presentation/home/widget/event_card_widget.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class HomeEventContentSection extends StatelessWidget {
  final List<Event>? eventList;
  const HomeEventContentSection({
    super.key,
    required this.eventList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 28),
      height: context.screenHeightPercentage(0.4),
      child: ListView.builder(
        itemCount: eventList?.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final event = eventList?[index];
          return EventCardWidget(event: event!);
        },
      ),
    );
  }
}
