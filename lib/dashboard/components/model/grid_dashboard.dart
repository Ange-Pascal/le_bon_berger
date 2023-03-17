import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/components/screens/absence.dart';
import 'package:lebonberger/dashboard/components/screens/activite.dart';
import 'package:lebonberger/dashboard/components/screens/annonce.dart';
import 'package:lebonberger/dashboard/components/screens/densite.dart';
import 'package:lebonberger/dashboard/components/screens/departement.dart';
import 'package:lebonberger/dashboard/components/screens/cellule.dart';
import 'package:lebonberger/dashboard/components/screens/parametre.dart';
import 'package:lebonberger/membres/MembreScreen.dart';

class GridDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var color = 0xff808000;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(CelluleHome());
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/cellule.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Cellules",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Cellules Actuelles",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){ Get.to(DepartementScreen());},
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/map.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Departements",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Departements actifs",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "25",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){Get.to(ActiviteScreen());},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/maison.jpg",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Maison",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Maison actuelle",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "50",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){Get.to(MembreScreen());},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/membre.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Membres",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Membres actifs",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "500",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(AnnonceScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/accepter.jpg",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Décisons",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Decisons par semaine",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(DensiteScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/visite.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Visites",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Visite par semaine",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){Get.to(AbsenceScreen());},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/absence.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Absences",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "3 Events",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ParametreScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/setting.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Paramètres",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Modifications",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "des infos de l'eglise",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

class Items {
  String? title;
  String? subtitle;
  String? event;
  String? img;
  Items({this.title, this.subtitle, this.event, this.img});
}
