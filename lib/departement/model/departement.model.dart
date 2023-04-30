// To parse this JSON data, do
//
//     final departement = departementFromJson(jsonString);

import 'dart:convert';

List<Departement> departementFromJson(String str) => List<Departement>.from(
    json.decode(str).map((x) => Departement.fromJson(x)));

String departementToJson(List<Departement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Departement {
  Departement({
    required this.id,
    required this.nomDepartement,
    this.isActive,
    this.isDeleted,
    required this.createdAt,
    required this.updatedAt, 
  });

  int id;
  String nomDepartement;
  dynamic isActive;
  dynamic isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory Departement.fromJson(Map<String, dynamic> json) => Departement(
        id: json["id"],
        nomDepartement: json["nom_departement"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_departement": nomDepartement,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
