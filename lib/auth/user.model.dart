// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.telephone,
    required this.isDelete,
    required this.role,
    this.eglise,
  });

  int id;
  String username;
  String email;
  String telephone;
  dynamic isDelete;
  String role;
  Eglise? eglise;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        telephone: json["telephone"],
        isDelete: json["isDelete"],
        role: json["role"],
        eglise: Eglise.fromJson(json["eglise"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "telephone": telephone,
        "isDelete": isDelete,
        "role": role,
        "eglise": eglise!.toJson(),
      };
}

class Eglise {
  Eglise({
    required this.id,
    required this.codeEglise,
    required this.nomEglise,
    required this.nomAbEglise,
    required this.typeEglise,
    required this.telephoneEglise,
    required this.emailEglise,
    required this.adresseEglise,
    required this.apiUrl,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int codeEglise;
  String nomEglise;
  String nomAbEglise;
  String typeEglise;
  String telephoneEglise;
  String emailEglise;
  String adresseEglise;
  String apiUrl;
  bool isActive;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Eglise.fromJson(Map<String, dynamic> json) => Eglise(
        id: json["id"],
        codeEglise: json["code_eglise"],
        nomEglise: json["nom_eglise"],
        nomAbEglise: json["nom_ab_eglise"],
        typeEglise: json["type_eglise"],
        telephoneEglise: json["telephone_eglise"],
        emailEglise: json["email_eglise"],
        adresseEglise: json["adresse_eglise"],
        apiUrl: json["api_url"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code_eglise": codeEglise,
        "nom_eglise": nomEglise,
        "nom_ab_eglise": nomAbEglise,
        "type_eglise": typeEglise,
        "telephone_eglise": telephoneEglise,
        "email_eglise": emailEglise,
        "adresse_eglise": adresseEglise,
        "api_url": apiUrl,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
