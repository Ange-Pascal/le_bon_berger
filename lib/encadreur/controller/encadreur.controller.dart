import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/encadreur/model/encadreur.model.dart';
import 'package:lebonberger/encadreur/screens/encadreurList.dart';
import 'package:lebonberger/encadreur/service/encadreur.service.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/membres/service/membre.service.dart';
import 'package:lebonberger/routes/app.routes.dart';

class EncadreurController extends GetxController {
  RxBool isLoading = false.obs;
  // Etape 1 creation des instances
  late List<Encadreur> encadreurs = <Encadreur>[].obs;
  late List<Membre> membres = <Membre>[].obs;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController prenomController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController userIdController = TextEditingController();

  var id = "";
  var userId = "".obs;
  var name = "";
  var prenom = "";
  var email = "";

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // Fetch cellule step 2 appel in service the method

  @override
  void onInit() async {
    nameController = TextEditingController();
    prenomController = TextEditingController();
    emailController = TextEditingController();
    userIdController = TextEditingController();
    // validerEncadreur();
    findEncadreurAll();
    findMembreAll();

    super.onInit();
  }

  // fetch cellule controller
  void findEncadreurAll() {
    isLoading(true);
    EncadreurService.flindAll().then((res) {
      isLoading(false);
      encadreurs.assignAll(encadreurFromJson(res));
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }

// Afficher les membres
  void setEncadreurItemValue(String newValue) {
    print(newValue);
    userId.value = newValue;
  }

  void findMembreAll() {
    MembreService.flindAll().then((res) {
      membres.assignAll(membreFromJson(res));
      print(membres.length);
    }).catchError((onError) => print(onError));
  }

  //

  

  // delete cellule controller
  void deleteEncadreur(Cellule id) {
    isLoading(true);
    EncadreurService.deleteEncadreur(id.id.toString()).then((res) {
      isLoading(false);
      findEncadreurAll();
      Get.back();
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }

  // Modifier la cellule controller function
}
