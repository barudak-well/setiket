// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:setiket/src/features/data.dart';

class Event {
  final int id;
  final int userId;
  final String title;
  final String description;
  final DateTime dateTime;
  final String city;
  final String locationDetail;
  final int ticketPrice;
  final int capacity;
  final int remainingCapacity;
  final CategoryEvent category;
  final StatusEvent status;

  Event({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.city,
    required this.locationDetail,
    required this.ticketPrice,
    required this.capacity,
    required this.remainingCapacity,
    this.category = CategoryEvent.other,
    this.status = StatusEvent.pending,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: map['dateTime'] as DateTime,
      city: map['city'] as String,
      locationDetail: map['locationDetail'] as String,
      ticketPrice: map['ticketPrice'] as int,
      capacity: map['capacity'] as int,
      remainingCapacity: map['remainingCapacity'] as int,
      category: map['category'] as CategoryEvent,
      status: map['status'] as StatusEvent,
    );
  }

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);
}
