import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/encadreur/controller/encadreur.controller.dart';
import 'package:lebonberger/encadreur/update-encadreur.dart';

class EncadreurDetails extends StatelessWidget {
   EncadreurDetails({super.key});  

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
                  title: Text("Liste des membres", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),),
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
                        child: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        )),
                    title: Text("${controller.encadreurs[index].name}  ${controller.encadreurs[index].prenom}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text("Email: ${controller.encadreurs[index].email}"),
                    // trailing: Icon(Icons.keyboard_arrow_right),
                    // onTap: () {
                    //   Get.to(EncadreurScreen());
                    // },
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
          Get.to(UpdateEncadreur()); 
        },
        child:  Icon(Icons.edit),
        backgroundColor: Colors.green,
      ),
    );
  }
}
