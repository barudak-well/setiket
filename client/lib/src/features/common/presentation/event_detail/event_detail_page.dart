import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/features/presentation.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class EventDetailPage extends ConsumerStatefulWidget {
  final int id;
  const EventDetailPage({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
  EventDetailController get controller =>
      ref.read(eventDetailControllerProvider.notifier);
  EventDetailState get state => ref.watch(eventDetailControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getEventById(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      brightness: Brightness.light,
      child: Scaffold(
        body: AsyncValueWidget(
          value: state.eventValue,
          data: (data) {
            return const Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      EventDetailContentSection(),
                    ],
                  ),
                ),
                EventDetailButtonSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
