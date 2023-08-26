// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:setiket/src/features/data.dart';

class Event {
  final int id;
  final int userId;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime startDatetime;
  final DateTime endDatetime;
  final CityEvent city;
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
    required this.imageUrl,
    required this.startDatetime,
    required this.endDatetime,
    required this.city,
    required this.locationDetail,
    required this.ticketPrice,
    required this.capacity,
    required this.remainingCapacity,
    this.category = CategoryEvent.other,
    this.status = StatusEvent.pending,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      startDatetime: map['startDatetime'] as DateTime,
      endDatetime: map['endDatetime'] as DateTime,
      city: map['city'] as CityEvent,
      locationDetail: map['locationDetail'] as String,
      ticketPrice: map['ticketPrice'] as int,
      capacity: map['capacity'] as int,
      remainingCapacity: map['remainingCapacity'] as int,
      category: map['category'] as CategoryEvent,
      status: map['status'] as StatusEvent,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Event.fromResponse(EventResponse response) {
    return Event(
      id: response.id ?? 0,
      userId: response.userId ?? 0,
      title: response.title ?? '',
      description: response.description ?? '',
      imageUrl: response.imageUrl ?? '',
      startDatetime: response.startDateTime != null ? DateTime.parse(response.startDateTime.toString()) : DateTime.now(),
      endDatetime: response.endDateTime != null ? DateTime.parse(response.endDateTime.toString()) : DateTime.now(),
      city: response.city ?? CityEvent.other,
      locationDetail: response.locationDetail ?? '',
      ticketPrice: response.ticketPrice ?? 0,
      capacity: response.capacity ?? 0,
      remainingCapacity: response.remainingCapacity ?? 0,
      category: response.category ?? CategoryEvent.other,
      status: response.status ?? StatusEvent.pending,
    );
  }
}
