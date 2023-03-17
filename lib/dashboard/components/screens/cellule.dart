import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cellule_screen.dart';
import 'package:get/get.dart';

class CelluleHome extends StatelessWidget {
  const CelluleHome({super.key});

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
              title: Text("Cellules"),
              centerTitle: true,
              expandedTitleScale: 1,
              collapseMode: CollapseMode.parallax,
              background: Image(
                image: AssetImage("assets/images/bible.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
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
                title: Text(" Nom: Cellule $index",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text("Date de création:  date $index"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Get.to(CelluleScreen());
                },
              ),
            );
          }, childCount: 10))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
