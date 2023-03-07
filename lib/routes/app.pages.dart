import 'package:get/get.dart';
import 'package:lebonberger/auth/login_page.dart';
import 'package:lebonberger/routes/app.routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    )
  ];
}
