import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lebonberger/membres/controller/membre.controller.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/routes/api.routes.dart';
import 'package:lebonberger/routes/app.routes.dart';
import 'package:searchfield/searchfield.dart';

class MembreHeader extends StatelessWidget {
  MembreHeader({super.key});

  MembreController controller = Get.put(MembreController());
  String title = 'Membres';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              '${title}' + ' (${controller.membres.length})',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(10.0),
            child: Ink(
              child: InkWell(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: DataSearch(membres: controller.membres),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Expanded(
                      child: Text('Rechercher un membre'),
                    ),
                    Icon(Icons.clear),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<dynamic> {
  List<Membre> membres;
  DataSearch({required this.membres});

  String defaultImage = "assets/images/users.png";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Membre> result = membres
        .where(
          (element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.departement.nomDepartement
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element.maison.cellule.nomCellule
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element.maison.nomMaison
                  .toLowerCase()
                  .contains(query.toLowerCase()),
        )
        .toList();
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text('${result[index].name}'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Membre> result = membres
        .where(
          (element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.departement.nomDepartement
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element.maison.cellule.nomCellule
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              element.maison.nomMaison
                  .toLowerCase()
                  .contains(query.toLowerCase()),
        )
        .toList();
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, int index) {
        return Ink(
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.DetailsMembre, arguments: result[index]);
            },
            child: Container(
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              color: Colors.white70,
              child: ListTile(
                title: Text(
                  result[index].name + ' ${result[index].name}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text('${result[index].departement.nomDepartement}'),
                // Text('${result[index].departement.nomDepartement}'),
                leading: Image.asset(defaultImage),
                trailing: Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromARGB(255, 183, 245, 188),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () {
                      Get.toNamed(AppRoutes.DetailsMembre,
                          arguments: result[index]);
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
