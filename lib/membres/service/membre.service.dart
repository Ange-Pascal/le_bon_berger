import 'dart:convert';
import 'dart:io';

// import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/auth/Token.dart';
import 'package:lebonberger/auth/cache_manager.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/routes/api.routes.dart';
import 'package:dio/dio.dart';

class MembreService {
  // Liste membres
  static Future<dynamic> flindAll() async {
    // print(Uri.parse(ApiRoutes.membres));

    http.Response res = await http.get(Uri.parse(ApiRoutes.membres), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token.getToken()}',
    });
    // print(res.body);

    return res.body;
  }

  static Future<dynamic> flindAllEnAttente() async {
    http.Response res =
        await http.get(Uri.parse('${ApiRoutes.membres}/en-attente'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token.getToken()}',
    });
    return res.body;
  }

  // Add Membres
  static Future<dynamic> create(Map<String, dynamic> data) async {
    // print(Uri.parse(ApiRoutes.membres));
    // print(data);
    http.Response res = await http.post(
      Uri.parse(ApiRoutes.membres),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );

    // print(res.body);

    return json.decode(res.body);
  }

  static Future<dynamic> uploadImage(File file, String membreId) async {
    Dio dio = Dio();
    Response response;

    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    // print('${ApiRoutes.membres}/$membreId');
    response = await dio.post('${ApiRoutes.membres}/$membreId',
        data: formData,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.getToken()}',
        }));

    // print(response.data);
    return jsonEncode(response.data);
  }

  static Future<Membre> findOndById(String membreId) async {
    Dio dio = Dio();
    Response response;

    response = await dio.get('${ApiRoutes.membres}/$membreId',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token.getToken()}',
        }));
    return membreFromJsonSingle(jsonEncode(response.data));
  }

  static Future<Membre> activerDesactiverCompte(
      dynamic data, String membreId) async {
    String path = '${ApiRoutes.membres}/action-request';

    // print(Uri.parse(ApiRoutes.membres));
    http.Response res = await http.post(
      Uri.parse(path),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );
    return membreFromJsonSingle(res.body);
  }

  static Future<dynamic> validerCreerMembre(Map<String, dynamic> data) async {
    // print(Uri.parse(ApiRoutes.membres));
    String path = '${ApiRoutes.membres}/validated-acount';
    http.Response res = await http.post(
      Uri.parse(path),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );

    return json.decode(res.body);
  }

  static Future<dynamic> supprimerCompte(String membreId) async {
    // print(Uri.parse(ApiRoutes.membres));
    String path = '${ApiRoutes.membres}/$membreId';
    // print(path);
    http.Response res = await http.delete(
      Uri.parse(path),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );

    return json.decode(res.body);
  }
}
