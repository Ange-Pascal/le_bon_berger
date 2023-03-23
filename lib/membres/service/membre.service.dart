import 'dart:convert';
import 'dart:io';

// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/routes/api.routes.dart';
import 'package:dio/dio.dart';

class MembreService {
  // Liste membres
  static Future<dynamic> flindAll() async {
    // print(Uri.parse(ApiRoutes.membres));
    http.Response res = await http.get(Uri.parse(ApiRoutes.membres));
    return res.body;
  }

  static Future<dynamic> flindAllEnAttente() async {
    http.Response res =
        await http.get(Uri.parse('${ApiRoutes.membres}/en-attente'));
    return res.body;
  }

  // Add Membres
  static Future<dynamic> create(Map<String, dynamic> data) async {
    print(Uri.parse(ApiRoutes.membres));
    http.Response res = await http.post(
      Uri.parse(ApiRoutes.membres),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

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
    response =
        await dio.patch('${ApiRoutes.membres}/$membreId', data: formData);

    // print(response.data);
    return jsonEncode(response.data);
  }

  static Future<Membre> findOndById(String membreId) async {
    Dio dio = Dio();
    Response response;

    response = await dio.get('${ApiRoutes.membres}/$membreId');
    return membreFromJsonSingle(jsonEncode(response.data));
  }

  static Future<Membre> activerDesactiverCompte(
      dynamic data, String membreId) async {
    String path = '${ApiRoutes.membres}/action-request';

    print(Uri.parse(ApiRoutes.membres));
    http.Response res = await http.post(
      Uri.parse(path),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print(res.body);

    return membreFromJsonSingle(res.body);
  }
}
