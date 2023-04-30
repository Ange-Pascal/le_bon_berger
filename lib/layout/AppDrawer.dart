import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:lebonberger/absence/screen/absence.dart';
import 'package:lebonberger/auth/auth.controller.dart';
import 'package:lebonberger/cellules/cellule-liste.dart';
import 'package:lebonberger/decisions/screens/decicion.dart';
import 'package:lebonberger/departement/screens/departement.dart';
import 'package:lebonberger/encadreur/components/screens/encadreur-home.dart';
import 'package:lebonberger/maison/screens/maison.dart';
import 'package:lebonberger/routes/app.routes.dart';
import 'package:lebonberger/visites/view/visite.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    super.key,
  });

  AuthController controller = Get.put(AuthController());
  // Map<String, dynamic> payload = AuthController().getPayload();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                      color: Colors.white,
                    ),
                    child: const Text(
                      'K',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromRGBO(24, 97, 44, 1)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    child: Text(
                      '${controller.getCurrentUser()['email']}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(24, 97, 44, 1),
            ),
          ),
          ListTile(
            title: const Text(
              'Tableau de bord',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
            onTap: () {
              Get.toNamed(AppRoutes.dashboard);
            },
          ),
          ListTile(
            title: const Text(
              'Membres',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
            onTap: () {
              Get.toNamed(AppRoutes.membre);
            },
          ),
          ListTile(
            title: const Text(
              'Cellules',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
            onTap: () {
              Get.to(CelluleHome());
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 189, 187, 187),
          ),
          ListTile(
            title: const Text(
              'Départements',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ), 
            ), 
            onTap: () {
              Get.to(DepartementScreen());
            },
          ),
          ListTile(
            title: const Text(
              'Maisons',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
            onTap: () {
              Get.to(MaisonView());
            },
          ),
          ListTile(
            title: const Text(
              'Visites',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ), 
            onTap: () {
              Get.to(VisiteHome());
            },
          ),
          const Divider(
            color: Color.fromARGB(255, 189, 187, 187),
          ), 
          ListTile(
            title: const Text(
              'Encadreurs',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ), 
            onTap: () {
              Get.to(EncadreurHome());
            },
          ),
          ListTile(
            title: const Text(
              'Absences',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ), 
            onTap: () {
              Get.to(AbsenceHome());
            },
          ),
          ListTile(
            title: const Text(
              'Décisions',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
            onTap: () {
              Get.to(DecisionHome());
            },
          ),
          
          const Divider(
            color: Color.fromARGB(255, 189, 187, 187),
          ),
          ListTile(
            title: const Text(
              'Se déconnecter',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Colors.red,
              ),
            ),
            onTap: () {
              // Get.toNamed(AppRoutes.welcome);
              controller.logOut();
            },
          ),
        ],
      ),
    );
  }
}
