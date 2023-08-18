import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:setiket/src/features/data.dart';

class AuthResponse extends Equatable {
  final String? token;
  final String? tokenType;
  final UserResponse? user;

  const AuthResponse({
    this.token,
    this.tokenType,
    this.user,
  });

  factory AuthResponse.fromRawJson(String str) =>
      AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : UserResponse.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "user": user?.toJson(),
      };

  @override
  List<Object?> get props => [token, tokenType, user];
}
