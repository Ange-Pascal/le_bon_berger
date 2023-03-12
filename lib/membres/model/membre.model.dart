// To parse this JSON data, do
//
//     final membre = membreFromJson(jsonString);

import 'dart:convert';

List<Membre> membreFromJson(String str) =>
    List<Membre>.from(json.decode(str).map((x) => Membre.fromJson(x)));

String membreToJson(List<Membre> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Membre {
  Membre({
    required this.id,
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
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.maison,
    required this.cellule,
    required this.departement,
  });

  int id;
  String civilite;
  String nom;
  String prenom;
  String telephone;
  String email;
  String sexe;
  dynamic photo;
  DateTime dateNaissance;
  String anneeConvers;
  String anneeBpEau;
  String anneeBpEsprit;
  String situationMat;
  int nombreEnfants;
  String profession;
  String classeAge;
  String personneContact;
  String dateDecision;
  String dateArrivee;
  bool isActive;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Maison maison;
  Cellule cellule;
  Cellule departement;

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
        cellule: Cellule.fromJson(json["cellule"]),
        departement: Cellule.fromJson(json["departement"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "civilite": civilite,
        "nom": nom,
        "prenom": prenom,
        "telephone": telephone,
        "email": email,
        "sexe": sexe,
        "photo": photo,
        "date_naissance":
            "${dateNaissance.year.toString().padLeft(4, '0')}-${dateNaissance.month.toString().padLeft(2, '0')}-${dateNaissance.day.toString().padLeft(2, '0')}",
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
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "maison": maison.toJson(),
        "cellule": cellule.toJson(),
        "departement": departement.toJson(),
      };
}

class Cellule {
  Cellule({
    required this.id,
    this.nomCellule,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.nomDepartement,
  });

  int id;
  String? nomCellule;
  bool isActive;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String? nomDepartement;

  factory Cellule.fromJson(Map<String, dynamic> json) => Cellule(
        id: json["id"],
        nomCellule: json["nom_cellule"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        nomDepartement: json["nom_departement"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_cellule": nomCellule,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "nom_departement": nomDepartement,
      };
}

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
