import 'dart:convert';

import 'package:equatable/equatable.dart';

enum RoleUser {
  user,
  admin,
  eo,
}

enum StatusUser { pending, verified, rejected }

class UserResponse extends Equatable {
  final int? id;
  final String? email;
  final String? fullname;
  final StatusUser? status;
  final RoleUser? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserResponse({
    this.id,
    this.email,
    this.fullname,
    this.status,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory UserResponse.fromRawJson(String str) =>
      UserResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        status: json["status"] == "VERIFIED"
            ? StatusUser.verified
            : json["status"] == "REJECTED"
                ? StatusUser.rejected
                : StatusUser.pending,
        role: json["role"] == "ADMIN"
            ? RoleUser.admin
            : json["role"] == "EO"
                ? RoleUser.eo
                : RoleUser.user,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "status": status,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [id, email, fullname, status, role];
}
