import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:lebonberger/user/screens/components/home_user_dashboard.dart'; 
import 'package:get/get.dart';

class HomeUserDashboard extends StatelessWidget {
  const HomeUserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 228, 230),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Bienvenue",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tableau de bord',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
                IconBadge(
                  icon: const Icon(
                    Icons.notification_important,
                    size: 60,
                  ),
                  itemCount: 20,
                  badgeColor: Colors.red,
                  itemColor: Colors.white,
                  hideZero: true,
                  onTap: () {
                    // Get.to(MembreListeScreen());
                    print('tester');
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              SizedBox(
                  width: 150,
                  child: Text(
                    "Cliquer ici pour signaler votre absence",
                    style:
                        GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                  )), 
                  SizedBox(width: 20, height: 20,), 
              InkWell(
                child: const Icon(
                  Icons.control_point,
                  size: 50,
                  color: Colors.green,
                ),
                onTap: () {
                  print('afficher la liste des membres');
                },
              )
            ],
          ),
          //DashboardView(),
          DashboardHomeUser(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'se deconnecter',
                  style: GoogleFonts.poppins(fontSize: 12),
                ), 
                SizedBox(width: 20,), 
                InkWell(
                child: const Icon(
                  Icons.logout,
                  size: 40,
                  color: Colors.green,
                ),
                onTap: () {
                  Get.back();
                },
              )
              ],
            ),
          )
        ],
      ),
    );
  }
}
