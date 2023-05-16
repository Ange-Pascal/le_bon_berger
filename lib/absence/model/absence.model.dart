// To parse this JSON data, do
//
//     final absence = absenceFromJson(jsonString);

import 'dart:convert';

List<Absence> absenceFromJson(String str) =>
    List<Absence>.from(json.decode(str).map((x) => Absence.fromJson(x))); 

    Absence absenceFromJsonSingle(String str) => Absence.fromJson(json.decode(str));

String absenceToJson(List<Absence> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Absence {
    int id;
    int userId;
    DateTime dateAbsence;
    String motifAbsence;
    int isDeleted;
    DateTime createdAt;
    DateTime updatedAt;

    Absence({
        required this.id,
        required this.userId,
        required this.dateAbsence,
        required this.motifAbsence,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Absence.fromJson(Map<String, dynamic> json) => Absence(
        id: json["id"],
        userId: json["user_id"],
        dateAbsence: DateTime.parse(json["date_absence"]),
        motifAbsence: json["motif_absence"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "date_absence": "${dateAbsence.year.toString().padLeft(4, '0')}-${dateAbsence.month.toString().padLeft(2, '0')}-${dateAbsence.day.toString().padLeft(2, '0')}",
        "motif_absence": motifAbsence,
        "isDeleted": isDeleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
