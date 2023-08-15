import 'dart:convert';

class RequestLogin {
  final String email;
  final String password;
  RequestLogin({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory RequestLogin.fromMap(Map<String, dynamic> map) {
    return RequestLogin(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestLogin.fromJson(String source) => RequestLogin.fromMap(json.decode(source) as Map<String, dynamic>);
}
