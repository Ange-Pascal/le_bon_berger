import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lebonberger/cellules/controller/cellule.controller.dart';
import 'package:lebonberger/delayed_animation.dart';
import 'package:lebonberger/membres/controller/membre.controller.dart';

class AddMembre extends StatefulWidget {
  const AddMembre({super.key});

  @override
  State<AddMembre> createState() => _AddMembreState();
}

class _AddMembreState extends State<AddMembre> {
  /// ADDED THESE THREE VARIABLES

  MembreController controller = Get.put(MembreController());

  List<String> classAge = <String>['Enfants', 'Adolescents', 'Adultes'];
  List<String> Maison = <String>['Maison 1', 'Maison 2', 'Maison 3'];
  List<String> Cellule = <String>['Cellule 1', 'Cellule 2', 'Cellule 3'];
  List<String> Departement = <String>[
    'Departement 1',
    'Departement 2',
    'Departement 3'
  ];
  int index = 0;
  late File file;
  late bool isFileLoading = false;

  bool goNext = false;
  bool goPrevious = false;

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      NumberStepper(
                        enableNextPreviousButtons: false,
                        numbers: [1, 2, 3],
                        activeStep: index,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(5),
                        child: Form(
                          key: controller.formkey,
                          child: Container(
                            child: index == 0
                                ? Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 60,
                                          child: Obx(
                                            () => DropdownButton(
                                              hint: Text('Civilité'),
                                              value: controller
                                                          .selected.value ==
                                                      ""
                                                  ? null
                                                  : controller.selected.value,
                                              items: controller.civilite
                                                  .map((e) => DropdownMenuItem(
                                                        child: Text(e),
                                                        value: e,
                                                      ))
                                                  .toList(),
                                              onChanged: (val) {
                                                controller.setSelected(val);
                                              },
                                              isExpanded: true,
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          controller: controller.nomcontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Nom',
                                            icon: Icon(Icons.person),
                                            labelStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          onSaved: (newValue) {
                                            controller.nom = newValue!;
                                          },
                                        ),
                                        TextFormField(
                                          controller:
                                              controller.prenomcontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Prénom(s)',
                                            icon: Icon(Icons.person),
                                            labelStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          onSaved: (newValue) {
                                            controller.prenom = newValue!;
                                          },
                                        ),
                                        TextFormField(
                                          controller:
                                              controller.telephonecontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Téléphone',
                                            icon: Icon(Icons.phone),
                                            labelStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          onSaved: (newValue) {
                                            controller.telephone = newValue!;
                                          },
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller:
                                              controller.emailcontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            icon: Icon(Icons.email),
                                            labelStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          onSaved: (newValue) {
                                            controller.email = newValue!;
                                          },
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 60,
                                          child: Obx(
                                            () => DropdownButton(
                                              hint: Text('Sexe'),
                                              value: controller
                                                          .selectedSexe.value ==
                                                      ""
                                                  ? null
                                                  : controller
                                                      .selectedSexe.value,
                                              items: controller.sexe
                                                  .map((e) => DropdownMenuItem(
                                                        child: Text(e),
                                                        value: e,
                                                      ))
                                                  .toList(),
                                              onChanged: (val) {
                                                controller.setSelectedSexe(val);
                                              },
                                              isExpanded: true,
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          controller:
                                              controller.datenaisscontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Date de naissance',
                                            icon: Icon(Icons.calendar_today),
                                            labelStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          readOnly: true,
                                          onSaved: (newValue) {
                                            controller.datenaiss = newValue!;
                                          },
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(
                                                        2000), //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101));

                                            if (pickedDate != null) {
                                              String formattedDate =
                                                  DateFormat('dd-MM-yyyy')
                                                      .format(pickedDate);

                                              controller.dateNaissanceDateTime =
                                                  pickedDate;

                                              controller.datenaisscontroller
                                                  .text = formattedDate;
                                            } else {
                                              print("Date is not selected");
                                            }
                                          },
                                        ),
                                        TextFormField(
                                          controller:
                                              controller.professioncontroller,
                                          decoration: InputDecoration(
                                            labelText: 'Profession',
                                            icon: Icon(Icons.work),
                                            labelStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                          onSaved: (newValue) {
                                            controller.profession = newValue!;
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                : index == 1
                                    ? Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10),
                                            TextFormField(
                                              controller: controller
                                                  .situationcontroller,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Situation Matrimoniale',
                                                icon: Icon(Icons.description),
                                                labelStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onSaved: (newValue) {
                                                controller.situation =
                                                    newValue!;
                                              },
                                            ),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  controller.enfantcontroller,
                                              decoration: InputDecoration(
                                                labelText: 'Nombre Enfants',
                                                icon: Icon(Icons.person),
                                                labelStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onSaved: (newValue) {
                                                controller.nbrenfants =
                                                    newValue!;
                                              },
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .conversioncontroller,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Année de convertion',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                                labelStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              readOnly: true,
                                              onSaved: (newValue) {
                                                controller.anneeconversion =
                                                    newValue!;
                                              },
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                            2000), //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2101));

                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(pickedDate);
                                                  controller
                                                      .conversioncontroller
                                                      .text = formattedDate;
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              },
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .baptemeeaucontroller,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Année de bapteme d\'eau',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                                labelStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onSaved: (newValue) {
                                                controller.baptemeeau =
                                                    newValue!;
                                              },
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                            2000), //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2101));

                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(pickedDate);

                                                  controller
                                                      .baptemeeaucontroller
                                                      .text = formattedDate;
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              },
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .baptemeespritcontroller,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Année de bapoteme du  Saint-Esprit',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                                labelStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onSaved: (newValue) {
                                                controller.baptemeesprit =
                                                    newValue!;
                                              },
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                            2000), //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2101));

                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(pickedDate);

                                                  controller
                                                      .baptemeespritcontroller
                                                      .text = formattedDate;
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60,
                                              child: Obx(
                                                () => DropdownButton(
                                                  hint: Text('Classe d\'âge'),
                                                  value: controller
                                                              .selectedClassAge ==
                                                          ""
                                                      ? null
                                                      : controller
                                                          .selectedClassAge
                                                          .value,
                                                  items: controller.classage
                                                      .map((e) =>
                                                          DropdownMenuItem(
                                                            child: Text(e),
                                                            value: e,
                                                          ))
                                                      .toList(),
                                                  onChanged: (val) {
                                                    controller
                                                        .setSelectedClassAge(
                                                            val);
                                                  },
                                                  isExpanded: true,
                                                ),
                                              ),
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .personcontactcontroller,
                                              decoration: InputDecoration(
                                                labelText: 'Personne Contact',
                                                icon: Icon(Icons.person),
                                                labelStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onSaved: (newValue) {
                                                controller.personcontact =
                                                    newValue!;
                                              },
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .datedecisioncontroller,
                                              decoration: InputDecoration(
                                                labelText: 'Date decision',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                                labelStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              readOnly: true,
                                              onSaved: (newValue) {
                                                controller.datedecision =
                                                    newValue!;
                                              },
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                            2000), //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2101));

                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(pickedDate);
                                                  controller
                                                      .datedecisioncontroller
                                                      .text = formattedDate;
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              },
                                            ),
                                            TextFormField(
                                              controller: controller
                                                  .datearrivecontroller,
                                              decoration: InputDecoration(
                                                labelText: 'Date arrivée',
                                                icon:
                                                    Icon(Icons.calendar_today),
                                                labelStyle: TextStyle(
                                                  color: Colors.grey[400],
                                                ),
                                              ),
                                              onSaved: (newValue) {
                                                controller.datearrive =
                                                    newValue!;
                                              },
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(
                                                            2000), //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2101));

                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(pickedDate);
                                                  controller
                                                      .datearrivecontroller
                                                      .text = formattedDate;
                                                } else {
                                                  print("Date is not selected");
                                                }
                                              },
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 60,
                                              child: Obx(
                                                () => DropdownButton(
                                                  hint: Text('Maison'),
                                                  value: controller
                                                              .selectedMaison ==
                                                          ""
                                                      ? null
                                                      : controller
                                                          .selectedMaison.value,
                                                  items: controller.maisons
                                                      .map(
                                                        (e) => DropdownMenuItem(
                                                          child:
                                                              Text(e.nomMaison),
                                                          value:
                                                              e.id.toString(),
                                                        ),
                                                      )
                                                      .toList(),
                                                  onChanged: (val) {
                                                    controller
                                                        .setSelectedMaison(val);
                                                  },
                                                  isExpanded: true,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 60,
                                              child: Obx(
                                                () => DropdownButton(
                                                  hint: Text('Département'),
                                                  value: controller
                                                              .selectedDepartement ==
                                                          ""
                                                      ? null
                                                      : controller
                                                          .selectedDepartement
                                                          .value,
                                                  items: controller.departements
                                                      .map(
                                                        (e) => DropdownMenuItem(
                                                          child: Text(
                                                              e.nomDepartement),
                                                          value:
                                                              e.id.toString(),
                                                        ),
                                                      )
                                                      .toList(),
                                                  onChanged: (val) {
                                                    controller
                                                        .setSelectedDepartement(
                                                            val);
                                                  },
                                                  isExpanded: true,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: index == 0
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceBetween,
                        children: [
                          index != 0
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Colors.grey,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                  ),
                                  child: Text(
                                    'PRECEDENT',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      index--;
                                    });
                                  },
                                )
                              : Container(),
                          index != 2
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Colors.green,
                                    padding: index == 0
                                        ? EdgeInsets.symmetric(
                                            horizontal: 120,
                                            vertical: 13,
                                          )
                                        : EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                  ),
                                  child: Text(
                                    'SUIVANT',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.onSaved();
                                    setState(() {
                                      index++;
                                    });
                                  },
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Color.fromARGB(255, 155, 6, 6),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                  ),
                                  child: Text(
                                    'ENREGISTRER',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.handleSubmit();
                                  },
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// DelayedAnimation(
//                                               delay: 500,
//                                               child: Stack(
//                                                 children: [
//                                                   Obx(
//                                                     () => CircleAvatar(
//                                                       radius: 80.0,
//                                                       child: ClipOval(
//                                                         child: (controller
//                                                                     .isLoadingFile !=
//                                                                 false)
//                                                             ? Image.file(
//                                                                 controller.file)
//                                                             : Image.asset(
//                                                                 'assets/images/user.png'),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Positioned(
//                                                     bottom: 3.0,
//                                                     right: 20.0,
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         Get.bottomSheet(
//                                                           Container(
//                                                             height: 120.0,
//                                                             color: Colors.white,
//                                                             width:
//                                                                 MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .width,
//                                                             margin: EdgeInsets
//                                                                 .symmetric(
//                                                               horizontal: 20.0,
//                                                               vertical: 20.0,
//                                                             ),
//                                                             child: Column(
//                                                               children: [
//                                                                 Text(
//                                                                   'Choisir une photo',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontFamily:
//                                                                         'Poppins',
//                                                                     fontSize:
//                                                                         20.0,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w400,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 20.0,
//                                                                 ),
//                                                                 Container(
//                                                                     width: MediaQuery.of(
//                                                                             context)
//                                                                         .size
//                                                                         .width,
//                                                                     child: Row(
//                                                                       mainAxisAlignment:
//                                                                           MainAxisAlignment
//                                                                               .spaceEvenly,
//                                                                       children: [
//                                                                         TextButton
//                                                                             .icon(
//                                                                           onPressed:
//                                                                               () {
//                                                                             // controller.takePhoto(ImageSource.camera);
//                                                                           },
//                                                                           icon:
//                                                                               Icon(Icons.camera_alt),
//                                                                           label:
//                                                                               Text('Caméra'),
//                                                                         ),
//                                                                         TextButton
//                                                                             .icon(
//                                                                           onPressed:
//                                                                               () {
//                                                                             // takePhoto(ImageSource.gallery);
//                                                                             controller.takePhoto(ImageSource.gallery);
//                                                                           },
//                                                                           icon:
//                                                                               Icon(Icons.photo_album),
//                                                                           label:
//                                                                               Text('galerie'),
//                                                                         ),
//                                                                       ],
//                                                                     )),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           isDismissible: true,
//                                                           backgroundColor:
//                                                               Colors.white,
//                                                           shape:
//                                                               RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         35),
//                                                             side: BorderSide(
//                                                                 width: 5,
//                                                                 color: Colors
//                                                                     .white),
//                                                           ),
//                                                           enableDrag: false,
//                                                         );
//                                                       },
//                                                       child: Icon(
//                                                         Icons.camera_alt,
//                                                         size: 35.0,
//                                                         color: Colors.black,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),