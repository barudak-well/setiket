import 'dart:convert';

import 'package:equatable/equatable.dart';

class ApiResponse extends Equatable {
  final bool? status;
  final String? message;
  final dynamic body;

  const ApiResponse({
    this.status,
    this.message,
    this.body,
  });

  factory ApiResponse.fromRawJson(String str) =>
      ApiResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["status"],
        message: json["message"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "body": {
          "status": status,
          "message": message,
          "body": body,
        }
      };

  @override
  List<Object?> get props => [status, message, body];
}
