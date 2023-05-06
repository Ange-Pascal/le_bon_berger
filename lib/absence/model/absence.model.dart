// To parse this JSON data, do
//
//     final absence = absenceFromJson(jsonString);

import 'dart:convert';

Absence absenceFromJson(String str) => Absence.fromJson(json.decode(str));

String absenceToJson(Absence data) => json.encode(data.toJson());

class Absence {
    DateTime dateAbsence;
    String motifAbsence;
    int userId;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Absence({
        required this.dateAbsence,
        required this.motifAbsence,
        required this.userId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Absence.fromJson(Map<String, dynamic> json) => Absence(
        dateAbsence: DateTime.parse(json["date_absence"]),
        motifAbsence: json["motif_absence"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "date_absence": "${dateAbsence.year.toString().padLeft(4, '0')}-${dateAbsence.month.toString().padLeft(2, '0')}-${dateAbsence.day.toString().padLeft(2, '0')}",
        "motif_absence": motifAbsence,
        "user_id": userId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
