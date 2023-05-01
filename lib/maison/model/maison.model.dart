// To parse this JSON data, do
//
//     final maison = maisonFromJson(jsonString);

import 'dart:convert';

import 'package:lebonberger/cellules/model/cellule.model.dart';

List<Maison> maisonFromJson(String str) =>
    List<Maison>.from(json.decode(str).map((x) => Maison.fromJson(x)));

Maison maisonFromJsonSingle(String str) => Maison.fromJson(json.decode(str));

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
    required this.cellule,
    this.createdAt,
  });

  int id;
  String nomMaison;
  String chefDeFamille;
  String telephone;
  String quartier;
  String repere;
  dynamic isActive;
  dynamic isDeleted;
  Cellule cellule;
  dynamic createdAt;

  factory Maison.fromJson(Map<String, dynamic> json) => Maison(
        id: json["id"],
        nomMaison: json["nom_maison"],
        chefDeFamille: json["chef_de_famille"],
        telephone: json["telephone"],
        quartier: json["quartier"],
        repere: json["repere"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        cellule: Cellule.fromJson(json["cellule"]),
        createdAt: DateTime.parse(json["created_at"]),
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
        "cellule": cellule.toJson(),
        "created_at": createdAt
      };
}
