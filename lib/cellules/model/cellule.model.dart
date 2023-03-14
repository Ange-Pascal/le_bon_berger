// To parse this JSON data, do
//
//     final cellule = celluleFromJson(jsonString);

import 'dart:convert';

List<Cellule> celluleFromJson(String str) =>
    List<Cellule>.from(json.decode(str).map((x) => Cellule.fromJson(x)));

String celluleToJson(List<Cellule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cellule {
  Cellule({
    required this.id,
    required this.nomCellule,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String nomCellule;
  bool isActive;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Cellule.fromJson(Map<String, dynamic> json) => Cellule(
        id: json["id"],
        nomCellule: json["nom_cellule"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_cellule": nomCellule,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
