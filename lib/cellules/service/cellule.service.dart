import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/routes/api.routes.dart';

import '../model/cellule.model.dart';

class CelluleService {
  // Liste cellules
  static Future<dynamic> flindAll() async {
    http.Response res = await http
        .get(Uri.parse('http://leecka.bptechnology.net/public/index.php/api'));

    if (res.statusCode == 200) {
        return Cellule.fromJson(jsonDecode(res.body));
      } else {
        throw Exception("impossible d'afficher les cellules");
      }
  }

  // Add Cellule
  static Future<dynamic> create(Map<String, dynamic> data) async {
    // print(Uri.parse(ApiRoutes.membres));
    // print(data);
    http.Response res = await http.post(
      Uri.parse(ApiRoutes.cellules),
      body: json.encode(data),
    );

    print(res.body);

    // return json.decode(res.body);
  }
}
