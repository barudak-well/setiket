import 'dart:convert';

class RequestRegister {
  final String email;
  final String password;
  final String username;
  final String birthdate;
  final int gender;
  RequestRegister({
    required this.email,
    required this.password,
    required this.username,
    required this.birthdate,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'username': username,
      'birthdate': birthdate,
      'gender': gender,
    };
  }

  factory RequestRegister.fromMap(Map<String, dynamic> map) {
    return RequestRegister(
      email: map['email'] as String,
      password: map['password'] as String,
      username: map['username'] as String,
      birthdate: map['birthdate'] as String,
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestRegister.fromJson(String source) =>
      RequestRegister.fromMap(json.decode(source) as Map<String, dynamic>);
}
