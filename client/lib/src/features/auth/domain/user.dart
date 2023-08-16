// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:setiket/src/features/auth/data/responses/responses.dart';

class User {
  final String token;
  final int id;
  final String email;
  final String fullname;
  final StatusUser status;
  final RoleUser role;

  User({
    required this.token,
    required this.id,
    required this.email,
    required this.fullname,
    this.status = StatusUser.pending,
    this.role = RoleUser.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'id': id,
      'email': email,
      'fullname': fullname,
      'status': status,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      token: map['token'] as String,
      id: map['id'] as int,
      email: map['email'] as String,
      fullname: map['fullname'] as String,
      status: map['status'] as StatusUser,
      role: map['role'] as RoleUser,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
