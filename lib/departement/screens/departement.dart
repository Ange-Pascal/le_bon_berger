import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/departement/controllers/departement.controller.dart';
import 'package:lebonberger/departement/screens/department-screen.dart';
import 'package:lebonberger/departement/screens/add-departement.dart';

class DepartementScreen extends StatelessWidget {
  DepartementScreen({super.key});

  DepartementController controller = Get.put(DepartementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        
        child: RefreshIndicator( 
          onRefresh: () async{
            controller.findDepartementAll();
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
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Departement",
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1,
                  collapseMode: CollapseMode.parallax,
                  background: const Image(
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
                            child: const Icon(
                              Icons.home,
                              color: Colors.white,
                            )),
                        title: Text(
                            '${controller.departements[index].nomDepartement}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Text(
                                '${controller.departements[index].createdAt}',
                                style: GoogleFonts.poppins(fontSize: 15),
                              ),
                            ]),
                        trailing: Icon(Icons.delete),
                        onTap: () {
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
                                      controller.deleteDepartement(
                                        controller.departements[0],
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
                      ),
                    );
                  }, childCount: controller.departements.length)))
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
      return Container(height: 400, child: AddDepartement());
    });
