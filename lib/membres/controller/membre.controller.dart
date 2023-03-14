import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/cellules/service/cellule.service.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/membres/service/membre.service.dart';

class MembreController extends GetxController {
  late List<Membre> membres = <Membre>[].obs;
  late List<Cellule> cellules = <Cellule>[].obs;
  RxBool isLoading = true.obs;
  late TextEditingController searchController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<String> civilite = <String>['Monsieur', 'Madame', 'Mademoiselle'];
  List<String> sexe = <String>['Masculin', 'Féminin'];
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

  @override
  void onInit() {
    findAll();
    findAllParams();

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
  }

  findAll() async {
    try {
      isLoading(false);
      var res = await MembreService.flindAll();
      membres.assignAll(membreFromJson(res));
      print(membres);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  findAllParams() async {
    try {
      isLoading(false);
      var res = await CelluleService.flindAll();
      cellules.assignAll(celluleFromJson(res));
      print(cellules);
    } catch (e) {
      isLoading(false);
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
    print(val);
    selectedCellule.value = val;
  }

  handleSubmit() {
    formkey.currentState!.save();

    Map<dynamic, dynamic> data = {
      "nom": nom,
      "prenom": prenom,
      "telephone": telephone,
      "email": email,
      "profession": profession,
      "civilite": selected.value,
      "sexe": selectedSexe.value,
      "datenaisse": datenaiss
    };

    print(data);
  }
}
