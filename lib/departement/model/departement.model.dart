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
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String nomDepartement;
  bool isActive;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Departement.fromJson(Map<String, dynamic> json) => Departement(
        id: json["id"],
        nomDepartement: json["nom_departement"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_departement": nomDepartement,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
