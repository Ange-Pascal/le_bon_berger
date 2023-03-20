import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/routes/api.routes.dart';

class DepartementService extends GetConnect {
  // Liste membres
  static Future<dynamic> flindAll() async {
    print(Uri.parse(ApiRoutes.departements));
    http.Response res = await http.get(Uri.parse(ApiRoutes.departements));
    return res.body;
  }
}
