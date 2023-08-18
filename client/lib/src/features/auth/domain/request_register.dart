import 'dart:convert';

class RequestRegister {
  final String fullname;
  final String email;
  final String password;
  final String role;
  RequestRegister({
    required this.fullname,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory RequestRegister.fromMap(Map<String, dynamic> map) {
    return RequestRegister(
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestRegister.fromJson(String source) =>
      RequestRegister.fromMap(json.decode(source) as Map<String, dynamic>);
}
