import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/absence/controller/absence.controller.dart';
import 'package:lebonberger/absence/screen/absenceDetail-screen.dart';
import 'package:lebonberger/membres/controller/membre.controller.dart';
import 'package:lebonberger/visites/view/add-visite.dart';

class AbsenceHome extends StatelessWidget {
   AbsenceHome({super.key,}); 

  AbsenceController controller = Get.put(AbsenceController());
  MembreController _membreController = Get.put(MembreController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RefreshIndicator( 
          onRefresh: () async {
            controller.findAbsenceAll();
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
                  title: Text("Absence",  style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),),
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
                          Icons.home,
                          color: Colors.white,
                        )),
                    title: Text(controller.absences[index].userId == _membreController.membres[index].id ? " Nom: ${_membreController.membres[index].name}" : "Aucun absence",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      // Text( controller.absences[index].userId == _membreController.membres[index].id ? "${_membreController.membres[index].name}" : "Aucune absence"),
                      // Text("${_controller.membre[index].id}"),
                    ]),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.to(AbsenceScreen(),
                              arguments: controller.absences[index].id);
                    },
                  ),
                );
              }, childCount: controller.absences.length)))
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

void _modal(BuildContext context) =>
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context, 
      isScrollControlled: true, 
      isDismissible: true,
      builder: (BuildContext context) {
      return AddVisite();
    });

