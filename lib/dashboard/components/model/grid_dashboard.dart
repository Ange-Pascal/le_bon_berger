
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/components/screens/programmes.dart';

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
          children:  [
            GestureDetector(
              onTap: (){
                Get.to(ProgrammeScreen()
              );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow:
                      [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5, 
                          blurRadius: 7
                        )
                      ]
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/calendar.png",
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Programmes",
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
                      "March, Wednesday",
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow:
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5, 
                        blurRadius: 7
                      )
                    ]
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/calendar.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Programmes",
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
                    "March, Wednesday",
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow:
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5, 
                        blurRadius: 7
                      )
                    ]
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/calendar.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Programmes",
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
                    "March, Wednesday",
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
            
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow:
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5, 
                        blurRadius: 7
                      )
                    ]
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/calendar.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Programmes",
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
                    "March, Wednesday",
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow:
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5, 
                        blurRadius: 7
                      )
                    ]
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/calendar.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Programmes",
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
                    "March, Wednesday",
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

            
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow:
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5, 
                        blurRadius: 7
                      )
                    ]
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/calendar.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Programmes",
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
                    "March, Wednesday",
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow:
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5, 
                        blurRadius: 7
                      )
                    ]
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/calendar.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Programmes",
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
                    "March, Wednesday",
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

          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow:
                    [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5, 
                        blurRadius: 7
                      )
                    ]
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/calendar.png",
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Programmes",
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
                    "March, Wednesday",
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
