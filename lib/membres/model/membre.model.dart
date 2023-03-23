// To parse this JSON data, do
//
//     final membre = membreFromJson(jsonString);

import 'dart:convert';

import 'package:lebonberger/departement/model/departement.model.dart';
import 'package:lebonberger/maison/model/maison.model.dart';

List<Membre> membreFromJson(String str) =>
    List<Membre>.from(json.decode(str).map((x) => Membre.fromJson(x)));

Membre membreFromJsonSingle(String str) => Membre.fromJson(json.decode(str));

String membreToJson(Membre data) => json.encode(data.toJson());

class Membre {
  Membre({
    this.id,
    required this.civilite,
    required this.nom,
    required this.prenom,
    required this.telephone,
    required this.email,
    required this.sexe,
    this.photo,
    required this.dateNaissance,
    required this.anneeConvers,
    required this.anneeBpEau,
    required this.anneeBpEsprit,
    required this.situationMat,
    required this.nombreEnfants,
    required this.profession,
    required this.classeAge,
    required this.personneContact,
    required this.dateDecision,
    required this.dateArrivee,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.maison,
    required this.departement,
  });

  int? id;
  String civilite;
  String nom;
  String prenom;
  String telephone;
  String email;
  String sexe;
  String? photo;
  dynamic dateNaissance;
  String anneeConvers;
  String anneeBpEau;
  String anneeBpEsprit;
  String situationMat;
  dynamic nombreEnfants;
  String profession;
  String classeAge;
  String personneContact;
  String dateDecision;
  String dateArrivee;
  int? isActive;
  bool? isDeleted;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic maison;
  dynamic departement;

  factory Membre.fromJson(Map<String, dynamic> json) => Membre(
        id: json["id"],
        civilite: json["civilite"],
        nom: json["nom"],
        prenom: json["prenom"],
        telephone: json["telephone"],
        email: json["email"],
        sexe: json["sexe"],
        photo: json["photo"],
        dateNaissance: DateTime.parse(json["date_naissance"]),
        anneeConvers: json["annee_convers"],
        anneeBpEau: json["annee_bp_eau"],
        anneeBpEsprit: json["annee_bp_esprit"],
        situationMat: json["situation_mat"],
        nombreEnfants: json["nombre_enfants"],
        profession: json["profession"],
        classeAge: json["classe_age"],
        personneContact: json["personne_contact"],
        dateDecision: json["date_decision"],
        dateArrivee: json["date_arrivee"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        maison: Maison.fromJson(json["maison"]),
        departement: Departement.fromJson(json["departement"]),
      );

  Map<String, dynamic> toJson() => {
        "civilite": civilite,
        "nom": nom,
        "prenom": prenom,
        "telephone": telephone,
        "email": email,
        "sexe": sexe,
        "photo": photo,
        "date_naissance": dateNaissance,
        "annee_convers": anneeConvers,
        "annee_bp_eau": anneeBpEau,
        "annee_bp_esprit": anneeBpEsprit,
        "situation_mat": situationMat,
        "nombre_enfants": nombreEnfants,
        "profession": profession,
        "classe_age": classeAge,
        "personne_contact": personneContact,
        "date_decision": dateDecision,
        "date_arrivee": dateArrivee,
        "maison": maison,
        "departement": departement,
      };
}
