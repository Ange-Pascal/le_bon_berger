import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/controller/cellule.controller.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dashboard/components/screens/cellule_screen.dart';
import 'add-cellule.dart';

class CelluleHome extends StatelessWidget {
  CelluleHome({super.key});

  CelluleController controller = Get.put(CelluleController()); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
              title: Text("Cellules " + '${controller.cellules.length}'),
              centerTitle: true,
              expandedTitleScale: 1,
              collapseMode: CollapseMode.parallax,
              background: const Image(
                image: AssetImage("assets/images/bible.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Obx(() {
            if(controller.isLoading.value == true){
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else{
              return SliverList(
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
                  title: Text('${controller.cellules[index].nomCellule}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  //subtitle: Text("Responsable:  Koffi $index"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Get.to(CelluleScreen());
                  },
                ),
              );
            }, childCount: controller.cellules.length));
            }
          })
        ],
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
      return SizedBox(
        height: 500,
        child: AddCellule());
    });
