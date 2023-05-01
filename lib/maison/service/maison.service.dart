import 'dart:convert';
import 'dart:io';

// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/auth/Token.dart';
import 'package:lebonberger/maison/model/maison.model.dart';
import 'package:lebonberger/routes/api.routes.dart';
import 'package:dio/dio.dart';

// class MaisonService extends GetConnect {
//   // Liste membres
//   static Future<dynamic> flindAll() async {
//     http.Response res = await http.get(
//       Uri.parse(ApiRoutes.maisons),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer ${Token.getToken()}',
//       },
//     );
//     return res.body;
//   }
// }

class MaisonService {
  // Liste maison , affichage
  static Future<dynamic> flindAll() async {
    // print(Uri.parse(ApiRoutes.membres));

    http.Response res = await http.get(Uri.parse(ApiRoutes.maisons), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token.getToken()}',
    });
    return res.body;
  }

  static Future<Maison> findOndById(String maisonId) async {
    Dio dio = Dio();
    Response response;

    response = await dio.get('${ApiRoutes.maisons}/$maisonId',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.getToken()}',
        }));

    return maisonFromJsonSingle(jsonEncode(response.data));
  }
}
