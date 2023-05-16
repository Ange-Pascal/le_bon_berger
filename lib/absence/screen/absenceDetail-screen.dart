import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/absence/controller/absence.detail.controller.dart';
import 'package:lebonberger/dashboard/services/add-decision.dart';

class AbsenceScreen extends StatelessWidget {
  AbsenceScreen({super.key});

  AbsenceDetailController controller = Get.put(AbsenceDetailController());

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
                                      " Date ",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ]),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 70),
                                  child: Row(
                                    children: [
                                      Obx(() {
                                        if (controller.absences[0] != null) {
                                          return Text(
                                            "${controller.absences[0].dateAbsence}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 18),
                                          );
                                        } else {
                                          return Text('');
                                        }
                                      })
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
                        Obx(() {
                          if (controller.absences[0] != null) {
                            return Expanded(
                              child: Text(
                                "${controller.absences[0].motifAbsence}",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.black),
                              ),
                            );
                          } else {
                            return Text('');
                          }
                        }),
                        const SizedBox(
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

void _modal(BuildContext context) => showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    builder: (BuildContext context) {
      return AddDecision();
    });
