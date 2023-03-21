import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/membres/controller/membre.controller.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/routes/api.routes.dart';

class MembreDetail extends StatelessWidget {
  MembreDetail({super.key});
  MembreController controller = Get.put(MembreController());
  final Membre membre = Get.arguments as Membre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: Color.fromARGB(255, 194, 194, 194),
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: membre.photo != null
                              ? NetworkImage(
                                  ApiRoutes.STORAGE_PUBLIC_PATH + membre.photo!)
                              : NetworkImage(
                                  ApiRoutes.STORAGE_PUBLIC_PATH + 'users.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: membre.photo != null
                      //     ? Image.network(
                      //         ApiRoutes.STORAGE_PUBLIC_PATH + membre.photo!)
                      //     : Image.asset(
                      //         "assets/images/users.png",
                      //         fit: BoxFit.cover,
                      //       ),
                    ),
                  ),
                  Positioned(
                    bottom: 3.0,
                    right: 110.0,
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          SingleChildScrollView(
                            child: Container(
                              height: 150.0,
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 20.0,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Choisir une photo',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        // TextButton.icon(
                                        //   onPressed: () {
                                        //     // controller.takePhoto(ImageSource.camera);
                                        //   },
                                        //   icon: Icon(Icons.camera_alt),
                                        //   label: Text('Caméra'),
                                        // ),
                                        TextButton.icon(
                                          onPressed: () {
                                            // takePhoto(ImageSource.gallery);
                                            controller.takePhoto(
                                                membre.id.toString());
                                          },
                                          icon: Icon(Icons.photo_album),
                                          label: Text('Galerie'),
                                          style: TextButton.styleFrom(
                                            minimumSize: Size.fromHeight(50),
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isDismissible: true,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: BorderSide(width: 5, color: Colors.white),
                          ),
                          enableDrag: false,
                        );
                      },
                      child: Icon(
                        Icons.camera_alt,
                        size: 35.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      '${membre.civilite} ${membre.nom} ${membre.prenom}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(72, 183, 245, 188),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '${DateFormat('dd.MM.yyyy').format(membre.dateNaissance)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Téléphone',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '(+225) ${membre.telephone.substring(0, 2)} ${membre.telephone.substring(2, 4)} ${membre.telephone.substring(4, 6)} ${membre.telephone.substring(6, 8)} ${membre.telephone.substring(8, 10)}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.email}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Sexe',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          membre.sexe == "F" ? "Féminin" : "Masculin",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Situation Matrimoniale',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.situationMat}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Nombre d\'enfants',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.nombreEnfants}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Profession',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.profession}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Classe d\'âge',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.classeAge}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Personne contact',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.personneContact}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 5,
                      thickness: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Date de décision',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.dateDecision}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Date d\'arrivée',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.dateArrivee}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Année de conversion',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.anneeConvers}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Baptisé d\eau',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          membre.anneeBpEau != null ? "Oui" : "Non",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Cellule',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.maison.cellule.nomCellule}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Maison',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.maison.nomMaison}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Département',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          '${membre.departement.nomDepartement}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Année de bapt. d\'eau',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          membre.anneeBpEau != null ? membre.anneeBpEau : "",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Baptisé du SE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          membre.anneeBpEsprit != null ? "Oui" : "Non",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text(
                          'Année de bapt. du SE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KottaOne',
                          ),
                        ),
                        trailing: Text(
                          membre.anneeBpEsprit != null
                              ? membre.anneeBpEsprit
                              : "",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          membre.isActive != false
                              ? TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Ajouter une décision',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.fromHeight(50),
                                    backgroundColor:
                                        Color.fromARGB(255, 236, 235, 235),
                                  ),
                                )
                              : Text(''),
                          Divider(),
                          membre.isActive == false
                              ? TextButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Activer le compte",
                                      titleStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                      middleText:
                                          "Voulez-vous vraiment activer ce compte ?",
                                      middleTextStyle: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                      backgroundColor: Colors.white,
                                      radius: 0.0,
                                      cancel: TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Annuler',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      confirm: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                        onPressed: () {},
                                        child: Text('Oui, activer'),
                                      ),
                                      barrierDismissible: false,
                                    );
                                  },
                                  child: Text(
                                    'Activer le compte',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.fromHeight(50),
                                    backgroundColor:
                                        Color.fromARGB(255, 236, 235, 235),
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "Désactiver le compte",
                                      titleStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      middleText:
                                          "Voulez-vous vraiment désactiver ce compte ?",
                                      middleTextStyle: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                      backgroundColor: Colors.white,
                                      radius: 0.0,
                                      cancel: TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Annuler',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      confirm: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 179, 186, 179),
                                        ),
                                        onPressed: () {},
                                        child: Text('Oui, désactiver'),
                                      ),
                                      barrierDismissible: false,
                                    );
                                  },
                                  child: Text(
                                    'Désactiver le compte',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.fromHeight(50),
                                    backgroundColor:
                                        Color.fromARGB(255, 236, 235, 235),
                                  ),
                                ),
                          Divider(),
                          TextButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title: "Supprimer le compte",
                                titleStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                middleText:
                                    "Voulez-vous vraiment supprimer ce compte ?",
                                middleTextStyle: TextStyle(
                                  fontSize: 15.0,
                                ),
                                backgroundColor: Colors.white,
                                radius: 0.0,
                                cancel: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'Annuler',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                confirm: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  onPressed: () {},
                                  child: Text('Oui, Supprimer'),
                                ),
                                barrierDismissible: false,
                              );
                            },
                            child: Text(
                              'Supprimer le compte',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromARGB(255, 219, 5, 5),
                                fontSize: 17,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                              backgroundColor:
                                  Color.fromARGB(255, 236, 189, 189),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
