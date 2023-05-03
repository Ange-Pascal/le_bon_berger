import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/auth/Token.dart';
import 'package:lebonberger/routes/api.routes.dart';



class CelluleService {
  // Liste cellules service
  static Future<dynamic> flindAll() async {
    // print(Uri.parse(ApiRoutes.membres));

    http.Response res = await http.get(Uri.parse(ApiRoutes.cellules), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token.getToken()}',
    });
    return res.body;
  }



  // Ajouter  Cellule step 2 service
  static Future<dynamic> create(Map<String, dynamic> data) async {
    // print(Uri.parse(ApiRoutes.membres));
    // print(data);
    http.Response res = await http.post(
      Uri.parse(ApiRoutes.cellules),
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

  static Future<dynamic> deleteCellule(String celluleId) async {
    // print(Uri.parse(ApiRoutes.membres));
    String path = '${ApiRoutes.cellules}/$celluleId';
    
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

  static Future<dynamic> updateCellule(String celluleId) async {
    // print(Uri.parse(ApiRoutes.membres));
    String path = '${ApiRoutes.cellules}/$celluleId';
    
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
