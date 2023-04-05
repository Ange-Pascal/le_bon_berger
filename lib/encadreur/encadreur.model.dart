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
    required this.egliseId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.prenom,
    required this.email,
    required this.nomEglise,
  });

  int id;
  int userId;
  int isDeleted;
  int egliseId;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String prenom;
  String email;
  String nomEglise;

  factory Encadreur.fromJson(Map<String, dynamic> json) => Encadreur(
        id: json["id"],
        userId: json["user_id"],
        isDeleted: json["isDeleted"],
        egliseId: json["eglise_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        prenom: json["prenom"],
        email: json["email"],
        nomEglise: json["nom_eglise"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "isDeleted": isDeleted,
        "eglise_id": egliseId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "prenom": prenom,
        "email": email,
        "nom_eglise": nomEglise,
      };
}
