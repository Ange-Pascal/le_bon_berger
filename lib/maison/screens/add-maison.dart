import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cellules/controller/cellule.controller.dart';
import '../controller/maison.controller.dart';

class AddMaison extends StatefulWidget {
  const AddMaison({super.key});

  @override
  State<AddMaison> createState() => _AddMaisonState();
}

class _AddMaisonState extends State<AddMaison> {
  MaisonController controller = Get.put(MaisonController());
  CelluleController _controller = Get.put(CelluleController());

  final _formKey = GlobalKey<FormState>();
  String? valueChoose;
  String? newValue;
  String? valueItem;
  final List listItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Ajouter une maison',
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
      )),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: controller.formkey,
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: controller.nomMaisonController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.home),
                        labelText: 'Nom de la Maison',
                        hintText: 'Entrez le nom de la maison',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (newValue) {
                      controller.nomMaison = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Champs Obligatoire';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Chef de Famille',
                        hintText: 'Entrez le chef de famille',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (newValue) {
                      controller.chefDeFamille = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Champs Obligatoire';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.map),
                        labelText: 'Repère de la Maison',
                        hintText: 'Entrez votre Répère',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (newValue) {
                      controller.repere = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Champs Obligatoire';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.map),
                        labelText: 'Quartier',
                        hintText: 'Quartier de la maison',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onSaved: (newValue) {
                      controller.quartier = newValue!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Champs Obligatoire';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  child: Obx(
                    () => Padding(
                      padding: EdgeInsets.all(10),
                      child: DropdownButtonFormField(
                        hint: Text("Choisir la cellule"),
                        value: valueChoose,
                        onChanged: (newValue) {
                          controller.setCelluleItemValue(newValue.toString());
                        },
                        items: controller.cellules.map((item) {
                          return DropdownMenuItem(
                            value: item.id,
                            child: Text('${item.nomCellule}'),
                          );
                        }).toList(),
                        onSaved: (newValue) {
                          controller.cellule.value = newValue.toString();
                        },
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Champs Obligatoire';
                          // }
                          // return null;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.MaisonSubmit();
                          },
                          child: Text(
                            "Ajouter",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                        )),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
