import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/controller/cellule.controller.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/dashboard/components/screens/cellule_screen.dart';
import 'package:lebonberger/membres/controller/membre.controller.dart';
import 'add-cellule.dart';

class CelluleHome extends StatelessWidget {
  CelluleHome({super.key});

  CelluleController controller = Get.put(CelluleController());
  MembreController membreController = Get.put(MembreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.findCelluleAll();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  leading: IconButton(
                      onPressed: () {
                        Get.to(DashBoardScreen());
                      },
                      icon: Icon(Icons.arrow_back)),
                  backgroundColor: Colors.green,
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      "Cellule ",
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1,
                    collapseMode: CollapseMode.parallax,
                    background: const Image(
                      image: AssetImage("assets/images/bible.jpg"),
                      fit: BoxFit.cover,
                    ),
                  )),
              Obx(
                () => SliverList(
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
                        title: Column(
                          children: [
                            Text('${controller.cellules[index].nomCellule}',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('${membreController.membres.length} membres')
                          ],
                        ),
                        leading: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                            child: InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "Modifier le nom de la cellule",
                                    titleStyle: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.green),
                                    titlePadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    content: Form( 
                                      key: controller.formkey,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: "Nom de la cellule",
                                            hintText: "Entrez le nouveau nom"),
                                            validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Champs obligatoire';
                                          }
                                          return null;
                                        },
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
                                          controller.updateCellules(
                                            controller.cellules[0]
                                          );
                                        },
                                        child: Text(
                                          'Modifier',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.grey[100]),
                                        )));
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                        trailing: Container(
                          child: InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                  titlePadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  title: "Supprimer une cellule",
                                  titleStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  middleText:
                                      "Voulez vous vraiment supprimer cette cellule?",
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
                                      controller.deleteCellule(
                                        controller.cellules[0],
                                      );
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
                              child: Icon(Icons.delete)),
                        ),
                      ),
                    );
                  }, childCount: controller.cellules.length),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _modal(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

void _modal(BuildContext context) => showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    // isScrollControlled: true,
    // isDismissible: true,
    builder: (BuildContext context) {
      return Container(height: 250, child: AddCellule());
    });
