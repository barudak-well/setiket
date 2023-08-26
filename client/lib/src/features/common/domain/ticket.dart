// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:setiket/src/features/common/data/responses/responses.dart';
import 'package:setiket/src/features/common/domain/event.dart';

class Ticket {
  final int id;
  final int eventId;
  final int userId;
  final int quantity;
  final int price;
  final Event? event;

  Ticket({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.quantity,
    required this.price,
    this.event,
  });

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] as int,
      eventId: map['eventId'] as int,
      userId: map['userId'] as int,
      quantity: map['quantity'] as int,
      price: map['price'] as int,
      event: map['event'] as Event,
    );
  }

  factory Ticket.fromJson(String source) =>
      Ticket.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Ticket.fromResponse(TicketResponse response) {
    return Ticket(
      id: response.id ?? 0,
      eventId: response.eventId ?? 0,
      userId: response.userId ?? 0,
      quantity: response.quantity ?? 0,
      price: response.price ?? 0,
      event:
          response.event == null ? null : Event.fromResponse(response.event!),
    );
  }
}
