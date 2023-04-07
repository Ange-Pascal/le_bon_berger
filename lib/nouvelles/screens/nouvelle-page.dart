import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/dashboard/components/screens/nouvelle-screen.dart';
import 'package:lebonberger/dashboard/services/add-visite.dart';
import 'package:lebonberger/nouvelles/controller/nouvelle-controller.dart';

class NouvellePage extends StatelessWidget {

  final nouvelleController = Get.put(NouvelleController(), permanent: true);

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
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("Nouvelles"),
              centerTitle: true,
              expandedTitleScale: 1,
              collapseMode: CollapseMode.parallax,
              background: Image(
                image: AssetImage("assets/images/bible.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: GetX<NouvelleController>( 
              builder: (controller) {
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
                    title: Text("${controller.nouvelles[index].libelleNouvelle}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.nouvelles[index].typeNouvelle}"),
                          Text("${controller.nouvelles[index].dateNouvelle}"),
                        ]),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.to(NouvelleScreen());
                    },
                  ),
                );
              }, childCount: controller.nouvelles.length));
              }
            ),
          )
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
    isScrollControlled: true,
    isDismissible: true,
    builder: (BuildContext context) {
      return AddVisite();
    });
