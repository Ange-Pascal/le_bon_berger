import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';

class DepartementScreen extends StatelessWidget {
  const DepartementScreen({super.key});

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
              title: Text("Departements"),
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
              height: 200,
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
                title: Text("Programme $index"),
                subtitle: Text("Grande Campagne d'evangelisation $index"),
              ),
            );
          }, childCount: 100))
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
