import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:lebonberger/absence/screen/absenceList-screen.dart';
import 'package:lebonberger/decisions/screens/decicion.dart';
import 'package:lebonberger/departement/screens/departement.dart';
import 'package:lebonberger/cellules/cellule-liste.dart';
import 'package:lebonberger/maison/screens/maison.dart';
import 'package:lebonberger/nouvelles/screens/nouvelle.dart';
import 'package:lebonberger/visites/view/visite.dart';

class GridDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var color = 0xff808000;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          // padding: EdgeInsets.only(left: 20, right: 20), 
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [          
            GestureDetector(
              onTap: () {
                Get.to(DecisionHome());
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
                Get.to(VisiteHome());
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
              onTap: (){Get.to(AbsenceHome());},
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
                Get.to(NouvelleHome());
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
                      "assets/images/infos.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Nouvelles",
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
                      "Informations",
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
          ]
          ),  
          
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
