import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:setiket/src/common_widgets/common_widgets.dart';
import 'package:setiket/src/constants/constants.dart';
import 'package:setiket/src/features/common/domain/event.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/routes/routes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ButtonWidget.primary(
          text: 'Event Detail',
          onTap: () {
            context.pushNamed(
              Routes.eventDetail.name,
              extra: Extras(
                datas: {
                  ExtrasKey.event: Event(
                    id: 0,
                    userId: 0,
                    title: 'International Band Music Concert',
                    description:
                        'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
                    imageUrl: '',
                    startDatetime: DateTime.now(),
                    endDatetime: DateTime.now(),
                    city: CityEvent.bandung,
                    locationDetail: 'Dipatiukur',
                    ticketPrice: 50000,
                    capacity: 50,
                    remainingCapacity: 40,
                  ),
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
