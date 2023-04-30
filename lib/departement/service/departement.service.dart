import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/auth/Token.dart';
import 'package:lebonberger/routes/api.routes.dart';

class DepartementService  extends GetxController{ 
  
  // Liste departements 

  static Future<dynamic> flindAll() async {

    http.Response res = await http.get(Uri.parse(ApiRoutes.departements), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token.getToken()}',
    });
    return res.body;
  } 

  // Ajouter un departement service

  static Future<dynamic> create(Map<String, dynamic> data) async {
    
    http.Response res = await http.post(
      Uri.parse(ApiRoutes.departements),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );
    return json.decode(res.body);
  }


  // Supprimer un departement 

  static Future<dynamic> deleteDepartement(String id) async {
    String path = '${ApiRoutes.departements}/$id';
    
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
  

}
