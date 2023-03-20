import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/dashboard/services/add-decision.dart';

class AbsenceScreen extends StatelessWidget {
  const AbsenceScreen({super.key});

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
                                "Absence",
                                style: GoogleFonts.poppins(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      " Fidèle ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      " Kouakoua jean ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ]),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 70),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Date",
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        "23-07-2024",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 18),
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
                          "Motif d'absence",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "le bébé et la famille se porte bien le bébé et la famille se porte bien le bébé et la famille se porte bien le bébé et la famille se porte bien le bébé et la famille se porte bien",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Center(
                            child: Text(
                          "Cliquer sur le bouton pour prendre une décision",
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontStyle: FontStyle.italic),
                        ))
                      ],
                    ),
                  )
                ]))
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _modal(context);
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ));
  }
}

void _modal(BuildContext context) =>
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context, 
      isScrollControlled: true, 
      isDismissible: true,
      builder: (BuildContext context) {
      return AddDecision();
    });

