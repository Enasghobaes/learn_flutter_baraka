// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'handling_model.dart';

class loginUserModel extends ResultModel {
  String email;
  String password;
  loginUserModel({
    required this.email,
    required this.password,
  });

  loginUserModel copyWith({
    String? email,
    String? password,
  }) {
    return loginUserModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory loginUserModel.fromMap(Map<String, dynamic> map) {
    return loginUserModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory loginUserModel.fromJson(String source) =>
      loginUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'loginUserModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant loginUserModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
