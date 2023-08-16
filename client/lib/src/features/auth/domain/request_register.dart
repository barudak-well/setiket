import 'dart:convert';

class RequestRegister {
  final String name;
  final String email;
  final String password;
  RequestRegister({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RequestRegister.fromMap(Map<String, dynamic> map) {
    return RequestRegister(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestRegister.fromJson(String source) =>
      RequestRegister.fromMap(json.decode(source) as Map<String, dynamic>);
}
