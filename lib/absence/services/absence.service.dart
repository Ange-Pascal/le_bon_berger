import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/absence/model/absence.model.dart';
import 'package:lebonberger/auth/Token.dart';
import 'package:lebonberger/routes/api.routes.dart';



class AbsenceService {
  // Liste absence service
  static Future<dynamic> flindAll() async {
    // print(Uri.parse(ApiRoutes.absences));

    http.Response res = await http.get(Uri.parse(ApiRoutes.absences), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token.getToken()}',
    });
    return res.body;
  }

  // Methode service pour afficher les infos d'une absence
  static Future<Absence> findOndById(String absenceId) async {
    Dio dio = Dio();
    Response response;

    response = await dio.get('${ApiRoutes.maisons}/$absenceId',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.getToken()}',
        }));

    return absenceFromJsonSingle(jsonEncode(response.data));
  }

  // Ajouter  Cellule step 2 service
  static Future<dynamic> create(Map<String, dynamic> data) async {
    // print(Uri.parse(ApiRoutes.membres));
    // print(data);
    http.Response res = await http.post(
      Uri.parse(ApiRoutes.absences),
      body: json.encode(data),
      headers: {
        'Content-Type': 'applicastion/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );
    return json.decode(res.body);
  }

  // Supprimer une cellule  service

  static Future<dynamic> deleteAbsence(String celluleId) async {
    // print(Uri.parse(ApiRoutes.membres));
    String path = '${ApiRoutes.absences}/$celluleId';
    
    http.Response res = await http.delete(
      Uri.parse(path),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );

    print(res.body);

    return json.decode(res.body);
  } 


  // modifier le nom de la cellule  service

  static Future<dynamic> updateAbsence(String absenceId) async {
    // print(Uri.parse(ApiRoutes.membres));
    String path = '${ApiRoutes.absences}/$absenceId';
    
    http.Response res = await http.put(
      Uri.parse(path),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );

    print(res.body);

    return json.decode(res.body);
  }
}
