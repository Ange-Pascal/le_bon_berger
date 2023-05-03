import 'package:get/get.dart';
import 'package:lebonberger/auth/login_page.dart';
import 'package:lebonberger/auth/welcome_page.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:lebonberger/maison/screens/maison-detail.dart';
import 'package:lebonberger/membres/MembreScreen.dart';
import 'package:lebonberger/membres/add-membre.dart';
import 'package:lebonberger/membres/membre-detail.dart';
import 'package:lebonberger/membres/membre-liste-en-attente-screen.dart';
import 'package:lebonberger/routes/app.routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.membre,
      page: () => MembreScreen(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashBoardScreen(),
    ),
    GetPage(
      name: AppRoutes.addMembre,
      page: () => AddMembre(),
    ),
    GetPage(
      name: AppRoutes.DetailsMembre,
      page: () => MembreDetail(),
    ),
    GetPage(
      name: AppRoutes.membreEnAttente,
      page: () => MembreListeEnAttenteScreen(),
    ),
    GetPage(
      name: AppRoutes.detailMaison,
      page: () => MaisonScreen(),
    )
  ];
}
