import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lebonberger/routes/api.routes.dart';

class CelluleService extends GetConnect {
  // Liste membres
  static Future<dynamic> flindAll() async {
    http.Response res = await http.get(Uri.parse(ApiRoutes.cellules));
    return res.body;
  }
}
