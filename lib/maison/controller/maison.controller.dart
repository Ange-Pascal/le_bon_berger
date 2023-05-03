import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/cellules/service/cellule.service.dart';
import 'package:lebonberger/maison/model/maison.model.dart';

import '../service/maison.service.dart';

class MaisonController extends GetxController {
  RxBool isLoading = false.obs;

  late List<Maison> maisons = <Maison>[].obs;
  late List<Cellule> cellules = <Cellule>[].obs;

  late TextEditingController nomMaisonController = TextEditingController();
  late TextEditingController chefDeFamilleController = TextEditingController();
  late TextEditingController telephoneController = TextEditingController();
  late TextEditingController quartierController = TextEditingController();
  late TextEditingController repereController = TextEditingController();
  late TextEditingController celluleController = TextEditingController();

  var id = "";
  var nomMaison = "";
  var chefDeFamille = "";
  var telephone = "";
  var quartier = "";
  var repere = "";
  var cellule = "".obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onInit() async {
    nomMaisonController = TextEditingController();
    chefDeFamilleController = TextEditingController();
    telephoneController = TextEditingController();
    quartierController = TextEditingController();
    repereController = TextEditingController();
    celluleController = TextEditingController();
    findMaisonAll();
    findCelluleAll();
    super.onInit();
  }

  // Methode controller pour Afficher les maisons

  void findMaisonAll() {
    isLoading(true);
    MaisonService.flindAll().then((res) {
      isLoading(false);
      maisons.assignAll(maisonFromJson(res));
      print('maison');
      print(maisons.length);
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }

  void setCelluleItemValue(String newValue) {
    print(newValue);
    cellule.value = newValue;
  }

  void findCelluleAll() {
    CelluleService.flindAll().then((res) {
      cellules.assignAll(celluleFromJson(res));
      print(cellules.length);
    }).catchError((onError) => print(onError));
  }

  // controller pour ajout de cellule

  void maisonSubmit() async {
    formkey.currentState!.save();
    if (formkey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "nom_maison": nomMaison,
        "chef_de_famille": chefDeFamille,
        "telephone": "0777952356",
        "quartier": quartier,
        "repere": repere,
        "cellule_id": cellule.value,
      };
      var res = await MaisonService.create(data);
      print(res);
      if (res != null && res["statusCode"] == 400) {
        Get.snackbar(
          "Champs Obligatoire",
          res["message"][0].toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        nomMaisonController.clear();
        chefDeFamilleController.clear();
        telephoneController.clear();
        repereController.clear();
        celluleController.clear();
        Get.back();
      }
    }
  }
}
