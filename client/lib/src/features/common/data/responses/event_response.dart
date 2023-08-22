import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

enum CategoryEvent {
  music,
  art,
  sports,
  culinary,
  tech,
  lifestyle,
  business,
  education,
  entertainment,
  charity,
  other,
}

enum StatusEvent { pending, verified, rejected }

class EventResponse extends Equatable {
  final int? id;
  final int? userId;
  final String? title;
  final String? description;
  final DateTime? dateTime;
  final String? city;
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
    this.dateTime,
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

  factory EventResponse.fromJson(Map<String, dynamic> json) => EventResponse(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        description: json["description"],
        dateTime: json['dateTime'] != null
            ? DateTime.parse(json['dateTime'])
            : DateTime.now(),
        city: json["city"],
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

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        description,
        dateTime,
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
