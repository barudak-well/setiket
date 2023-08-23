import 'package:flutter/material.dart';
import 'package:setiket/src/features/common/presentation/home/widget/event_card_widget.dart';
import 'package:setiket/src/features/data.dart';
import 'package:setiket/src/features/domain.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

class HomeEventContentSection extends StatelessWidget {
  const HomeEventContentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = [
      Event(
        id: 1,
        title: 'Flutter Event',
        description: 'The biggest Flutter event in Indonesia',
        imageUrl: 'assets/images/event_dummy.png',
        capacity: 100,
        city: CityEvent.bandung,
        endDatetime: DateTime.now(),
        startDatetime: DateTime.now(),
        locationDetail: 'Jl. Dipatiukur No.112, Bandung',
        remainingCapacity: 100,
        ticketPrice: 100000,
        userId: 1,
        category: CategoryEvent.education,
        status: StatusEvent.verified,
      ),
      Event(
        id: 2,
        title: 'Music Festival',
        description: 'A vibrant music festival with local and international artists',
        imageUrl: 'assets/images/event_dummy.png',
        capacity: 5000,
        city: CityEvent.jakarta,
        startDatetime: DateTime(2023, 9, 15, 18, 0),
        endDatetime: DateTime(2023, 9, 16, 2, 0),
        locationDetail: 'Senayan Park, Jakarta',
        remainingCapacity: 1500,
        ticketPrice: 250000,
        userId: 2,
        category: CategoryEvent.entertainment,
        status: StatusEvent.verified,
      ),
      Event(
        id: 3,
        title: 'Tech Conference',
        description: 'Explore the latest trends in technology and innovation',
        imageUrl: 'assets/images/event_dummy.png',
        capacity: 300,
        city: CityEvent.surabaya,
        startDatetime: DateTime(2023, 10, 10, 9, 0),
        endDatetime: DateTime(2023, 10, 11, 18, 0),
        locationDetail: 'Yogyakarta Convention Center',
        remainingCapacity: 50,
        ticketPrice: 75000,
        userId: 3,
        category: CategoryEvent.lifestyle,
        status: StatusEvent.verified,
      ),
      Event(
        id: 4,
        title: 'Art Exhibition',
        description: 'A showcase of contemporary art and creativity',
        imageUrl: 'assets/images/event_dummy.png',
        capacity: 200,
        city: CityEvent.other,
        startDatetime: DateTime(2023, 11, 5, 10, 0),
        endDatetime: DateTime(2023, 11, 7, 18, 0),
        locationDetail: 'Ubud Art Gallery, Bali',
        remainingCapacity: 100,
        ticketPrice: 50000,
        userId: 4,
        category: CategoryEvent.art,
        status: StatusEvent.verified,
      ),
      Event(
        id: 5,
        title: 'Fitness Workshop',
        description: 'Get fit and healthy with expert-led fitness workshops',
        imageUrl: 'assets/images/event_dummy.png',
        capacity: 50,
        city: CityEvent.surabaya,
        startDatetime: DateTime(2023, 9, 30, 14, 0),
        endDatetime: DateTime(2023, 9, 30, 17, 0),
        locationDetail: 'FitZone Gym, Surabaya',
        remainingCapacity: 10,
        ticketPrice: 75000,
        userId: 5,
        category: CategoryEvent.business,
        status: StatusEvent.verified,
      )

      // create dummy event with different data
    ];
    return Container(
      padding: const EdgeInsets.only(left: 28),
      height: context.screenHeightPercentage(0.4),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final event = data[index];
          return EventCardWidget(event: event);
        },
      ),
    );
  }
}
