// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String token;
  final int id;
  final String username;
  final String email;
  final String birthdate;
  final int gender;

  User({
    required this.token,
    required this.id,
    required this.username,
    required this.email,
    required this.birthdate,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'id': id,
      'username': username,
      'email': email,
      'birthdate': birthdate,
      'gender': gender,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      token: map['token'] as String,
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      birthdate: map['birthdate'] as String,
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
