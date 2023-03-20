import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/cellules/service/cellule.service.dart';
import 'package:lebonberger/departement/model/departement.model.dart';
import 'package:lebonberger/departement/service/departement.service.dart';
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

  RxBool isLoading = true.obs;
  late TextEditingController searchController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<String> civilite = <String>['M.', 'Mme', 'Mlle'];
  List<String> sexe = <String>['M', 'F'];
  List<String> classage = <String>[
    "Enfants (00 à 14 ans)",
    "Adolescents (15 à 24 ans)",
    "Adultes (25 à 64 ans)",
    "Aînés (65 ans et plus)"
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
  late DateTime dateNaissanceDateTime = DateTime.now();
  final isLoadingFile = false.obs;
  RxString pathString = "".obs;

  @override
  void onInit() async {
    findAll();
    findAllMaison();
    findAllDepartement();
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
    try {
      isLoading(false);
      var res = await MembreService.flindAll();
      membres.assignAll(membreFromJson(res));
      // print(membres);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  flindAllEnAttente() async {
    try {
      isLoading(false);
      var res = await MembreService.flindAllEnAttente();
      membresEnAttente.assignAll(membreFromJson(res));
      // print(membres);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  findAllMaison() async {
    try {
      var res = await MaisonService.flindAll();
      maisons.assignAll(maisonFromJson(res));
      print(maisons);
    } catch (e) {
      print(e);
    }
  }

  findAllDepartement() async {
    try {
      var res = await DepartementService.flindAll();
      departements.assignAll(departementFromJson(res));
      // print(departements);
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
    // FilePickerResult? result;
    // String? fileName;
    // PlatformFile? pickerFile;
    // File? fileToDisplay;

    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      File file = File(imageFile.path);
      // print(imageFile.path);

      // String str =
      //     "{id: 7, civilite: Mme, nom: Ode, prenom: Nadège, telephone: 0102090800, email: ode@oramge.com, sexe: F, photo: image_picker_E1DE00E5-A79E-4574-AD27-FE24B10F9FEA-26636-00002071AA15CDEF.jpg-1679073908451-494588774.jpg, date_naissance: 2000-02-08, annee_convers: 01-03-2023, annee_bp_eau: 02-03-2023, annee_bp_esprit: 15-03-2023, situation_mat: Célibataire, nombre_enfants: 4, profession: Commerciale, classe_age: Adultes (25 à 64 ans), personne_contact: Personne, date_decision: 15-03-2023, date_arrivee: 15-03-2023, isActive: false, isDeleted: false, createdAt: 2023-03-15T16:04:07.160Z, updatedAt: 2023-03-17T17:25:08.000Z, deletedAt: null}";

      var res = await MembreService.uploadImage(file, membreId);

      if (res != null) {
        Membre membre = membreFromJsonSingle(res);
        print(membre);
        // Get.toNamed(AppRoutes.DetailsMembre, arguments: membre);
        findAll();
        Get.toNamed(AppRoutes.membre);
      }

      // Get.to(MembreDetail(), arguments: membre);
    }

    // pathString = imageFile.path as RxString;

    // await MembreService.uploadImage(pickedFile!.path, membreId);
  }

  handleSubmit() async {
    formkey.currentState!.save();
    // formkey.currentState?.reset();

    if (formkey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "civilite": selected.value,
        "nom": nom,
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
        "maison": selectedMaison.value,
        "departement": selectedDepartement.value,
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
        findAll();
        Get.toNamed(AppRoutes.membre);
      }
    }
  }

  // convertToDecode() {
  //   final decode = jsonDecode(Get.parameters['membre']!);
  //   final passToModel = Membre.fromJson(decode);
  //   membre(passToModel);
  //   // or if you are using getBuilder
  //   // try do it like this
  //   // model.value = passToModel;
  //   // update();
  //   // don't forget to call update() since it's needed from getbuilder;
  // }
}
