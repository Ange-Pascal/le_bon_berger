import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

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
                        "Date de création",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "24-05-2022",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Get.defaultDialog(
                                    title: "Modifier le departement",
                                    titleStyle: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.green),
                                    titlePadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    content: Form( 
                                      //key: controller.formkey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                          decoration: const InputDecoration(
                                              labelText: "Nom du departement",
                                              hintText: "Entrez le nouveau nom"),
                                              validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Champs obligatoire';
                                            }
                                            return null;
                                          },
                                        ),
                                        
                                        ]
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(20),
                                    cancel: TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        'Annuler',
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    confirm: ElevatedButton(
                                        onPressed: () {
                                          
                                        },
                                        child: Text(
                                          'Modifier',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.grey[100]),
                                        )
                                        )

                                );
                              }, child: Icon(Icons.edit)),
                          SizedBox(
                            width: 100,
                          ),
                          ElevatedButton(
                              onPressed: () {
                               Get.defaultDialog(
                                titlePadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  title: "Supprimer un departement",
                                  titleStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  middleText:
                                      "Voulez vous vraiment supprimer ce departement?",
                                  middleTextStyle: const TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 15.0,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20.0,
                                  cancel: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      'Annuler',
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  confirm: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    onPressed: () {
                                      
                                    },
                                    child: Text(
                                      'Oui, Supprimer',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: Colors.grey[100]),
                                    ),
                                  ),
                                  barrierDismissible: false,
                                );
                               
                              }, child: Icon(Icons.delete)),
                        ],
                      )
                    ],
                  ),
                )
              ]))
            ],
          )
        ],
      ),
    );
  }
}