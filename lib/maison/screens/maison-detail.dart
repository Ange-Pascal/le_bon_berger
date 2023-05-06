import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/maison/controller/maison.detail.controller.dart';

class MaisonScreen extends StatelessWidget {
  MaisonScreen({super.key});

  MaisonDetailController controller = Get.put(MaisonDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 350,
                backgroundColor: Colors.grey[100],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/bible.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.1)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Maison",
                              style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Obx(
                              () => Text(
                                "${controller.maisons[0].nomMaison}",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Chef de Famille:',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Obx(() {
                        if (controller.maisons[0] != null) {
                          return Text(
                            '${controller.maisons[0].chefDeFamille}',
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          );
                        } else {
                          return Text('');
                        }
                      }),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Repère',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () {
                          if (controller.maisons[0] != null) {
                            return Text(
                              '${controller.maisons[0].repere}',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            );
                          } else {
                            return Text("");
                          }
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Quartier',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () {
                          if (controller.maisons[0] != null) {
                            return Text(
                              '${controller.maisons[0].quartier}',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            );
                          } else {
                            return Text('');
                          }
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Date de création",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () {
                          if (controller.maisons[0] != null) {
                            return Text(
                              "${DateFormat('dd.MM.yyyy').format(controller.maisons[0].createdAt)}",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            );
                          } else {
                            return Text('');
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Get.defaultDialog(
                                    title: "Modifier la maison",
                                    titleStyle: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.green),
                                    titlePadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    content: Form(
                                      //key: controller.formkey,
                                      child: Column(children: [
                                        TextFormField(
                                          decoration: const InputDecoration(
                                              labelText: "Nom de la maison",
                                              hintText:
                                                  "Entrez le nouveau nom"),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Champs obligatoire';
                                            }
                                            return null;
                                          },
                                        ),
                                      ]),
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
                                        onPressed: () {},
                                        child: Text(
                                          'Modifier',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.grey[100]),
                                        )));
                              },
                              child: Icon(Icons.edit)),
                          const SizedBox(
                            width: 100,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  titlePadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  title: "Supprimer une maison",
                                  titleStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  middleText:
                                      "Voulez vous vraiment supprimer cette maison?",
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
                                    onPressed: () { controller.deleteMaison(
                                      controller.maisons[0], 
                                    );  Get.back();},
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
                        ],
                      )
                    ],
                  ),
                )
              ]))
            ],
          ),
      ),
    );
  }
}
