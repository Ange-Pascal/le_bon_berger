import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/components/screens/cellule.dart';

class CelluleScreen extends StatelessWidget {
  const CelluleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Hero(
                    tag: Text("Cellule Elkana"),
                    child: Image.asset(
                      "assets/images/bible.jpg",
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      fit: BoxFit.cover,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.green
                  ),
                  child: IconButton(
                      onPressed: () {
                        Get.to(CelluleHome());
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Cellule Elkana",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(
                          10
                        ),
                        height: 50, 
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.green),
                        child: const Icon(Icons.person_4, color: Colors.white, size: 50,)),
                      Text("Mr Koffi Jean" , style: GoogleFonts.poppins(fontSize: 25, color: Colors.black),)
                    ], 
                
                  ),
                )
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ));
  }
}
