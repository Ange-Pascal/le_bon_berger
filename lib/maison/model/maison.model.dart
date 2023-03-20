// To parse this JSON data, do
//
//     final maison = maisonFromJson(jsonString);

import 'dart:convert';

import 'package:lebonberger/cellules/model/cellule.model.dart';

List<Maison> maisonFromJson(String str) =>
    List<Maison>.from(json.decode(str).map((x) => Maison.fromJson(x)));

String maisonToJson(List<Maison> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Maison {
  Maison({
    required this.id,
    required this.nomMaison,
    required this.chefDeFamille,
    required this.telephone,
    required this.quartier,
    required this.repere,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.cellule,
  });

  int id;
  String nomMaison;
  String chefDeFamille;
  String telephone;
  String quartier;
  String repere;
  bool isActive;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Cellule cellule;

  factory Maison.fromJson(Map<String, dynamic> json) => Maison(
        id: json["id"],
        nomMaison: json["nom_maison"],
        chefDeFamille: json["chef_de_famille"],
        telephone: json["telephone"],
        quartier: json["quartier"],
        repere: json["repere"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        cellule: Cellule.fromJson(json["cellule"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_maison": nomMaison,
        "chef_de_famille": chefDeFamille,
        "telephone": telephone,
        "quartier": quartier,
        "repere": repere,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "cellule": cellule.toJson(),
      };
}
