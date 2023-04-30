import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:lebonberger/dashboard/components/model/dashboard-view.dart';
import 'package:lebonberger/dashboard/components/model/grid_dashboard.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 228, 230),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
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
            children: [
              SizedBox(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: CircularPercentIndicator(
                  radius: 60,
                  lineWidth: 20,
                  percent: 0.8,
                  progressColor: Colors.yellow[400],
                  backgroundColor: Colors.grey,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    '80%',
                    style: GoogleFonts.poppins(fontSize: 25),
                  ),
                ),
              )),
              SizedBox(
                  width: 150,
                  child: Text(
                    'Vous avez utilisé jusqu\'à ce jour 80% de votre espace',
                    style:
                        GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                  )),
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
          GridDashboard(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cliquer ici pour ajouter un encadreur',
                  style: GoogleFonts.poppins(fontSize: 12),
                ), 
                SizedBox(width: 20,), 
                InkWell(
                child: const Icon(
                  Icons.control_point,
                  size: 40,
                  color: Colors.green,
                ),
                onTap: () {
                  print('Ajouter un encadreur');
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
