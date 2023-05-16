import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/auth/Token.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/routes/api.routes.dart';

// class EncadreurService extends GetConnect {
//   // Liste membres
//   static Future<dynamic> flindAll() async {
//     http.Response res = await http.get(
//       Uri.parse(ApiRoutes.encadreur),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer ${Token.getToken()}',
//       },
//     );
//     return res.body;
//   }
// }

class EncadreurService {
  // Liste cellules service
  static Future<dynamic> flindAll() async {
    // print(Uri.parse(ApiRoutes.membres));

    http.Response res =
        await http.get(Uri.parse(ApiRoutes.encadreur), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token.getToken()}',
    });
    return res.body;
  }

  

  // valider un encadreur service
  static Future<dynamic> validerEncadreur(dynamic data) async {
    // print(Uri.parse(ApiRoutes.membres));
    http.Response res = await http.post(
      Uri.parse(ApiRoutes.encadreur),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );
    return res.body;
  }

  // Ajouter  un encadreur step 2 service
  static Future<dynamic> create(Map<String, dynamic> data) async {
    // print(Uri.parse(ApiRoutes.membres));
    // print(data);
    http.Response res = await http.post(
      Uri.parse(ApiRoutes.encadreur),
      body: json.encode(data),
      headers: {
        'Content-Type': 'applicastion/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );
    return json.decode(res.body);
  }

  // Supprimer un encadreur

  static Future<dynamic> deleteEncadreur(String id) async {
    // print(Uri.parse(ApiRoutes.membres));
    String path = '${ApiRoutes.encadreur}/$id';

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

  // modifier un encadreur
}
