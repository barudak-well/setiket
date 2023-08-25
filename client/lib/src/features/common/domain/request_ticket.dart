import 'dart:convert';

class RequestTicket {
  final int quantity;
  final int eventId;
  final int userId;
  RequestTicket({
    required this.quantity,
    required this.eventId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'eventId': eventId,
      'userId': userId,
    };
  }

  factory RequestTicket.fromMap(Map<String, dynamic> map) {
    return RequestTicket(
      quantity: map['quantity'] as int,
      eventId: map['eventId'] as int,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestTicket.fromJson(String source) =>
      RequestTicket.fromMap(json.decode(source) as Map<String, dynamic>);
}
