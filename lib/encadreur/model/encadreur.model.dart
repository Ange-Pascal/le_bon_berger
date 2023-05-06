// To parse this JSON data, do
//
//     final encadreur = encadreurFromJson(jsonString);

import 'dart:convert';

List<Encadreur> encadreurFromJson(String str) =>
    List<Encadreur>.from(json.decode(str).map((x) => Encadreur.fromJson(x)));

String encadreurToJson(List<Encadreur> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Encadreur {
  Encadreur({
    required this.id,
    required this.userId,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.prenom,
    required this.email,
  });

  int id;
  int userId;
  int isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String prenom;
  String email;

  factory Encadreur.fromJson(Map<String, dynamic> json) => Encadreur(
        id: json["id"],
        userId: json["user_id"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        prenom: json["prenom"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "isDeleted": isDeleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "prenom": prenom,
        "email": email,
      };
}
