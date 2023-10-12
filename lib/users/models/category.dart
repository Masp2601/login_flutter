import 'dart:convert';

import 'package:mysql_client/mysql_client.dart';

class Categoria {
  Categoria({
    this.id,
    this.name,
    this.image,
    this.createAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? image;
  String? createAt;
  String? updatedAt;

  factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categoria.fromResult(ResultSetRow row) => Categoria(
        id: row.colAt(0) as String,
        name: row.colAt(1) as String,
        image: row.colAt(2),
        createAt: row.colAt(3) as String,
        updatedAt: row.colAt(4) as String,
      );

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        name: json["name"],
        image: "http://51.161.35.133/images/" + json['image_url'],
        createAt: json["create_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "create_at": createAt,
        "updated_at": updatedAt,
      };
}
