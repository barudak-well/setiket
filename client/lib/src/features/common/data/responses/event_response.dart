import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

enum CategoryEvent {
  music('MUSIC'),
  art('ART'),
  sports('SPORTS'),
  culinary('CULINARY'),
  tech('TECH'),
  lifestyle('LIFESTYLE'),
  business('BUSINESS'),
  education('EDUCATION'),
  entertainment('ENTERTAINMENT'),
  charity('CHARITY'),
  other('OTHER');

  const CategoryEvent(this.value);

  final String value;
}

enum CityEvent {
  bandung('BANDUNG'),
  jakarta('JAKARTA'),
  surabaya('SURABAYA'),
  other('OTHER');

  const CityEvent(this.value);

  final String value;
}

enum StatusEvent {
  pending('PENDING'),
  verified('VERIFIED'),
  rejected('REJECTED');

  const StatusEvent(this.value);

  final String value;
}

class EventResponse extends Equatable {
  final int? id;
  final int? userId;
  final String? title;
  final String? description;
  final String? imageUrl;
  final DateTime? startDateTime;
  final DateTime? endDateTime;
  final CityEvent? city;
  final String? locationDetail;
  final int? ticketPrice;
  final int? capacity;
  final int? remainingCapacity;
  final CategoryEvent? category;
  final StatusEvent? status;
  final DateTime? createdAt;

  const EventResponse({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.imageUrl,
    this.startDateTime,
    this.endDateTime,
    this.city,
    this.locationDetail,
    this.ticketPrice,
    this.capacity,
    this.remainingCapacity,
    this.category,
    this.status,
    this.createdAt,
  });

  factory EventResponse.fromRawJson(String str) =>
      EventResponse.fromJson(json.decode(str));

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"],
      endDateTime: json["endDatetime"] != null
          ? DateTime.parse(json["endDatetime"])
          : DateTime.now(),
      startDateTime: json["startDatetime"] != null
          ? DateTime.parse(json["startDatetime"])
          : DateTime.now(),
      city: json["city"].toString().cityEvent,
      locationDetail: json["locationDetail"],
      ticketPrice: json["ticketPrice"],
      capacity: json["capacity"],
      remainingCapacity: json["remainingCapacity"],
      category: json["category"].toString().categoryEvent,
      status: json["role"].toString().statusEvent,
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        description,
        imageUrl,
        startDateTime,
        endDateTime,
        city,
        locationDetail,
        ticketPrice,
        capacity,
        remainingCapacity,
        category,
        status,
        createdAt
      ];
}
