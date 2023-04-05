import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/auth/Token.dart';
import 'package:lebonberger/routes/api.routes.dart';

class EncadreurService extends GetConnect {
  // Liste membres
  static Future<dynamic> flindAll() async {
    http.Response res = await http.get(
      Uri.parse(ApiRoutes.encadreur),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Token.getToken()}',
      },
    );
    return res.body;
  }
}
