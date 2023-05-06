import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/encadreur/add-encadreur.dart';
import 'package:lebonberger/encadreur/controller/encadreur.controller.dart';
import 'package:lebonberger/encadreur/screens/encadreur-detail.dart';

class EncadreurList extends StatelessWidget {
   EncadreurList({super.key});  

  EncadreurController controller = Get.put(EncadreurController());  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RefreshIndicator( 
          onRefresh: () async {
            controller.findEncadreurAll();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back)),
                backgroundColor: Colors.green,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace:  FlexibleSpaceBar(
                  title: Text("Encadreur", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),),
                  centerTitle: true,
                  expandedTitleScale: 1,
                  collapseMode: CollapseMode.parallax,
                  background: Image(
                    image: AssetImage("assets/images/bible.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Obx(() => SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            offset: Offset(0, 3))
                      ]),
                  child: ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: InkWell( 
                          onTap: () {
                            Get.defaultDialog(
                                  titlePadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  title: "Supprimer un encadreur",
                                  titleStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  middleText:
                                      "Voulez vous vraiment supprimer cet encadreur?",
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
                                      // controller.deleteCellule(
                                      //   controller.cellules[0],
                                      // );
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
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        )),
                    title: Text("${controller.encadreurs[index].name}  ${controller.encadreurs[index].prenom}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text("Email: ${controller.encadreurs[index].email}"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.to(EncadreurDetails());
                    },
                  ),
                  
                );
              }, childCount: controller.encadreurs.length)
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddEncadreur()); 
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
