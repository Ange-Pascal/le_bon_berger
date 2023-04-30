import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class DecisionScreen extends StatelessWidget {
  const DecisionScreen({super.key});

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
                                "Décision A",
                                style: GoogleFonts.poppins(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Statut A",
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
                                        "Assigné à : ",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Adolphe Hitler",
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
                          "Suit à",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ), 
                        Text(
                          "Son absence",
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(height: 10,), 
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center, 
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                            "Date de décision:",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "12-04-2030",
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.grey),
                          ),
                          ]
                        ), 
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center, 
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                            "Date de décision:",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "12-04-2030",
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.grey),
                          ),
                          ]
                        ), 
                        const SizedBox(height: 20,), 
                        Text(
                          "Commentaire",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ), 
                        Text(
                          "Il est sous discipline jusqu'au 31 Decembre",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ]))
              ],
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {_modal(context);},
        //   child: const Icon(Icons.add),
        //   backgroundColor: Colors.green,
        // )
        );
  }
}


// void _modal(BuildContext context) => showModalBottomSheet(
//   context: context,
//    builder: (context) => UpdateDepartement()
// );