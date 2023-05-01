import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lebonberger/auth/auth.controller.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/cellules/service/cellule.service.dart';
import 'package:lebonberger/departement/model/departement.model.dart';
import 'package:lebonberger/departement/service/departement.service.dart';
import 'package:lebonberger/encadreur/encadreur.model.dart';
import 'package:lebonberger/encadreur/encadreur.service.dart';
import 'package:lebonberger/maison/model/maison.model.dart';
import 'package:lebonberger/maison/service/maison.service.dart';
import 'package:lebonberger/membres/membre-detail.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/membres/service/membre.service.dart';
import 'package:lebonberger/routes/app.routes.dart';

class MembreController extends GetxController {
  late List<Membre> membres = <Membre>[].obs;
  late List<Membre> membresEnAttente = <Membre>[].obs;

  late List<Cellule> cellules = <Cellule>[].obs;
  late List<Maison> maisons = <Maison>[].obs;
  late List<Departement> departements = <Departement>[].obs;
  late List<Encadreur> encadreurs = <Encadreur>[].obs;

  RxBool isLoading = false.obs;
  late TextEditingController searchController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<String> civilite = <String>['M.', 'Mme', 'Mlle'];
  List<String> sexe = <String>['M', 'F'];
  List<String> classage = <String>[
    "Enfants",
    "Adolescents",
    "Adultes",
    "Aînés"
  ];

  late TextEditingController nomcontroller = TextEditingController();
  late TextEditingController prenomcontroller = TextEditingController();
  late TextEditingController telephonecontroller = TextEditingController();
  late TextEditingController emailcontroller = TextEditingController();
  late TextEditingController datenaisscontroller = TextEditingController();
  late TextEditingController professioncontroller = TextEditingController();
  late TextEditingController situationcontroller = TextEditingController();
  late TextEditingController enfantcontroller = TextEditingController();
  late TextEditingController conversioncontroller = TextEditingController();
  late TextEditingController baptemeeaucontroller = TextEditingController();
  late TextEditingController baptemeespritcontroller = TextEditingController();
  late TextEditingController personcontactcontroller = TextEditingController();
  late TextEditingController datedecisioncontroller = TextEditingController();
  late TextEditingController datearrivecontroller = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  // Membre membreDetail = Get.arguments as Membre;

  var nom = "";
  var prenom = "";
  var telephone = "";
  var email = "";
  var datenaiss = "";
  var profession = "";
  var situation = "";
  var nbrenfants = "";
  var anneeconversion = "";
  var baptemeeau = "";
  var baptemeesprit = "";
  var personcontact = "";
  var datedecision = "";
  var datearrive = "";
  final selected = "".obs;
  final selectedSexe = "".obs;
  final selectedClassAge = "".obs;
  final selectedCellule = "".obs;
  final selectedMaison = "".obs;
  final selectedDepartement = "".obs;
  final selectedEncadreur = "".obs;
  late DateTime dateNaissanceDateTime = DateTime.now();
  final isLoadingFile = false.obs;
  RxString pathString = "".obs;

  @override
  void onInit() async {
    findAll();
    findAllMaison();
    findAllDepartement();
    findallEncadreur();
    flindAllEnAttente();

    searchController = TextEditingController();
    nomcontroller = TextEditingController();
    prenomcontroller = TextEditingController();
    telephonecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    datenaisscontroller = TextEditingController();
    professioncontroller = TextEditingController();
    situationcontroller = TextEditingController();
    enfantcontroller = TextEditingController();
    conversioncontroller = TextEditingController();
    baptemeeaucontroller = TextEditingController();
    baptemeespritcontroller = TextEditingController();
    personcontactcontroller = TextEditingController();
    datedecisioncontroller = TextEditingController();
    datearrivecontroller = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    findAll();
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    nomcontroller.dispose();
    prenomcontroller.dispose();
    telephonecontroller.dispose();
    emailcontroller.dispose();
    datenaisscontroller.dispose();
    professioncontroller.dispose();
    situationcontroller.dispose();
    enfantcontroller.dispose();
    conversioncontroller.dispose();
    baptemeeaucontroller.dispose();
    baptemeespritcontroller.dispose();
    personcontactcontroller.dispose();
    datearrivecontroller.dispose();
    formkey.currentState?.dispose();
  }

  findAll() async {
    isLoading(true);
    MembreService.flindAll().then((res) {
      // print(res);
      isLoading(false);
      membres.assignAll(membreFromJson(res));
    }).catchError((onError) {
      // print("error");
      isLoading(false);
      print(onError);
    });
  }

  flindAllEnAttente() async {
    try {
      isLoading(false);
      var res = await MembreService.flindAllEnAttente();
      membresEnAttente.assignAll(membreFromJson(res));
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  findAllMaison() async {
    try {
      var res = await MaisonService.flindAll();
      maisons.assignAll(maisonFromJson(res));
      print(maisons.length);
    } catch (e) {
      print(e);
    }
  }

  findAllDepartement() async {
    try {
      var res = await DepartementService.flindAll();
      departements.assignAll(departementFromJson(res));
      print(departements.length);
    } catch (e) {
      print(e);
    }
  }

  findallEncadreur() async {
    try {
      var res = await EncadreurService.flindAll();

      encadreurs.assignAll(encadreurFromJson(res));
      print(encadreurs.length);
    } catch (e) {
      print(e);
    }
  }

  setSelected(val) {
    selected.value = val;
  }

  setSelectedSexe(val) {
    selectedSexe.value = val;
  }

  setSelectedClassAge(val) {
    selectedClassAge.value = val;
  }

  setSelectedCellule(val) {
    selectedCellule.value = val;
  }

  setSelectedMaison(val) {
    selectedMaison.value = val;
  }

  setSelectedDepartement(val) {
    selectedDepartement.value = val;
  }

  setSelectedEncadreur(val) {
    selectedEncadreur.value = val;
  }

  getsexe(String val) {
    return val == "Masculin" ? "M" : "F";
  }

  onSaved() {
    formkey.currentState!.save();
  }

  void convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    print(todayDate);
  }

  void takePhoto(String membreId) async {
    isLoadingFile(true);

    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      File file = File(imageFile.path);
      var res = await MembreService.uploadImage(file, membreId);
      if (res != null) {
        Membre membre = membreFromJsonSingle(res);
      }
    }
  }

  handleSubmit() async {
    formkey.currentState!.save();
    // formkey.currentState?.reset();

    if (formkey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "civilite": selected.value,
        "name": nom,
        "prenom": prenom,
        "telephone": telephone,
        "email": email,
        "sexe": selectedSexe.value,
        "date_naissance":
            DateFormat('yyyy-MM-dd').format(dateNaissanceDateTime),
        "annee_convers": anneeconversion,
        "annee_bp_eau": baptemeeau,
        "annee_bp_esprit": baptemeesprit,
        "situation_mat": situation,
        "nombre_enfants": nbrenfants,
        "profession": profession,
        "classe_age": selectedClassAge.value,
        "personne_contact": personcontact,
        "date_decision": datedecision,
        "date_arrivee": datearrive,
        "maison_id": selectedMaison.value,
        "departement_id": selectedDepartement.value,
        "encadreur_id": selectedEncadreur.value
      };

      // print(DateFormat('yyyy-MM-dd').format(DateTime.parse("2023/03/07")));
      // convertDateFromString(datenaiss);
      // print(data);

      var res = await MembreService.create(data);
      // print(res[0]);
      if (res != null && res["statusCode"] == 400) {
        Get.snackbar(
          "Champs Obligatoire",
          res["message"][0].toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        formkey.currentState?.reset();
        flindAllEnAttente();
        Get.toNamed(AppRoutes.membre);
      }
    }
  }

  refreshController() {
    AuthController authController = Get.find();
    authController.getCurrentUser();
  }
}
