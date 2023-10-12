// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

import 'package:mysql_client/mysql_client.dart';

class User1 {
  User1({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.rememberToken,
    this.createAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? rememberToken;
  String? createAt;
  String? updatedAt;

  factory User1.fromJson(String str) => User1.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User1.fromResult(ResultSetRow row) => User1(
        id: row.colAt(0) as String,
        name: row.colAt(1) as String,
        email: row.colAt(2) as String,
        emailVerifiedAt: row.colAt(3),
        password: row.colAt(4) as String,
        rememberToken: row.colAt(5),
        createAt: row.colAt(6),
        updatedAt: row.colAt(7) as String,
      );

  factory User1.fromMap(Map<String, dynamic> json) => User1(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"],
        rememberToken: json["remember_token"],
        createAt: json["create_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "remember_token": rememberToken,
        "create_at": createAt,
        "updated_at": updatedAt,
      };
}
