import 'package:setiket/src/features/common/domain/domain.dart';

class MyEvents {
  final List<Ticket> upcomingEvents;
  final List<Ticket> pastEvents;
  MyEvents({required this.upcomingEvents, required this.pastEvents});
}
