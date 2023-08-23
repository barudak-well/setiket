import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:setiket/src/shared/extensions/extensions.dart';

enum RoleUser {
  user('USER'),
  admin('ADMIN'),
  eo('EO');

  const RoleUser(this.value);

  final String value;
}

enum StatusUser {
  pending('PENDING'),
  verified('VERIFIED'),
  rejected('REJECTED');

  const StatusUser(this.value);

  final String value;
}

class UserResponse extends Equatable {
  final int? id;
  final String? email;
  final String? fullname;
  final StatusUser? status;
  final RoleUser? role;
  final DateTime? createdAt;

  const UserResponse({
    this.id,
    this.email,
    this.fullname,
    this.status,
    this.role,
    this.createdAt,
  });

  factory UserResponse.fromRawJson(String str) =>
      UserResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        status: json["status"].toString().statusUser,
        role: json["role"].toString().roleUser,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "status": status,
        "role": role,
        "createdAt": createdAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [id, email, fullname, status, role];
}
