import 'package:dio/dio.dart';
import 'package:lebonberger/routes/api.routes.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class AuthService {
  static Future<dynamic> login(Map<String, dynamic> data) async {
    try {
      String path = '${ApiRoutes.CORE_BASE_URL}/login';

      http.Response res = await http.post(
        Uri.parse(path),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );
      // print(res.body);
      return res.body;
    } catch (e) {
      print(e);
      return e;
    }
  }

  static Future<dynamic> findTodo() async {
    String path = "https://chaka-brenda.com/api/totos";

    http.Response res = await http.get(Uri.parse(path), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    return res.body;
  }
}
