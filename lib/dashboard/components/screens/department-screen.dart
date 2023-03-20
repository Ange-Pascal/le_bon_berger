import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/services/update-departement.dart';

class DepartementView extends StatelessWidget {
  const DepartementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 350,
                  backgroundColor: Colors.grey[100],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/bible.jpg"),
                              fit: BoxFit.cover)),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                              Colors.white,
                              Colors.white.withOpacity(0.1)
                            ])),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                " Groupe Vocal",
                                style: GoogleFonts.poppins(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "20 Membres",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 70),
                                  child: Row(
                                    children: [
                                      Text(
                                        "7 Femmes",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        "3 Garçons",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Responsable du groupe",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ), 
                        Text(
                          "Koffi Jacob",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(height: 10,), 
                        Text(
                          "Numero de Téléphone",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ), 
                        Text(
                          "+225 0758964837",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ]))
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {_modal(context);},
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ));
  }
}


void _modal(BuildContext context) => showModalBottomSheet(
  context: context,
   builder: (context) => UpdateDepartement()
);