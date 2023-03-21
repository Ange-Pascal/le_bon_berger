import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lebonberger/routes/app.routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

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
                      'jeanmarcokassa@gmail.com',
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
          ),
          ListTile(
            title: const Text(
              'Maisons',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Visites',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 189, 187, 187),
          ),
          ListTile(
            title: const Text(
              'Décisions',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Absences',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
              ),
            ),
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
              Get.toNamed(AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
