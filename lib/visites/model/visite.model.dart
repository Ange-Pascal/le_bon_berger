// To parse this JSON data, do
//
//     final maison = maisonFromJson(jsonString);

import 'dart:convert';

import 'package:lebonberger/maison/model/maison.model.dart';
import 'package:lebonberger/membres/model/membre.model.dart';

List<Visite> visiteFromJson(String str) =>
    List<Visite>.from(json.decode(str).map((x) => Visite.fromJson(x)));

Visite visiteFromJsonSingle(String str) => Visite.fromJson(json.decode(str));

String visiteToJson(List<Visite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Visite {
  Visite({
    required this.id,
    required this.numeroVisite,
    required this.dateVisite,
    required this.rapportDeVisite,
    required this.respDeVisite,
    required this.maison,
    required this.fidele,
    required this.isDeleted,
    this.createdAt,
  });

  int id;
  String numeroVisite;
  dynamic dateVisite;
  String rapportDeVisite;
  String respDeVisite;
  Maison maison;
  Membre fidele;
  dynamic isDeleted;
  dynamic createdAt;

  factory Visite.fromJson(Map<String, dynamic> json) => Visite(
        id: json["id"],
        numeroVisite: json["numero_De_visite"],
        dateVisite: DateTime.parse(json["date_de_visite"],),
        rapportDeVisite: json["rapport_de_visite"],
        respDeVisite: json["responsable_de_visite"],
        isDeleted: json["isDeleted"],
        maison: Maison.fromJson(json["maison"]),
        fidele: Membre.fromJson(json["fidele"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "numero_De_visite": numeroVisite,
        "date_de_visite": dateVisite,
        "responsable_de_visite": rapportDeVisite,
        "fidele": fidele,
        "isDeleted": isDeleted,
        "created_at": createdAt
      };
}
