import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/absence/model/absence.model.dart';
import 'package:lebonberger/absence/services/absence.service.dart';

class AbsenceController extends GetxController {
  RxBool isLoading = false.obs;
  // Etape 1 creation des instances
  late List<Absence> absences = <Absence>[].obs;
  late TextEditingController motifAbsenceController = TextEditingController();
  late TextEditingController dateAbsenceController = TextEditingController();
  late TextEditingController userIdController = TextEditingController();
  var motifAbsence = "";
  var dateAbsence = "";
  var userId = "".obs;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // Fetch cellule step 2 appel in service the method

  @override
  void onInit() async {
    findAbsenceAll();

    motifAbsenceController = TextEditingController();
    motifAbsenceController = TextEditingController();
    userIdController = TextEditingController();
    super.onInit();
  }

  // fetch absence controller
  void findAbsenceAll() {
    isLoading(true);
    AbsenceService.flindAll().then((res) {
      isLoading(false);
      absences.assignAll(absenceFromJson(res));
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }

  // controller pour ajout de cellule

  celluleSubmit() async {
    formkey.currentState!.save();
    if (formkey.currentState!.validate()) {
      Map<String, dynamic> data = {
        // "nom_cellule" : nomCellule,
      };

      var res = await AbsenceService.create(data);
      if (res != null && res["statusCode"] == 400) {
        Get.snackbar(
          "Champs Obligatoire",
          res["message"][0].toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        motifAbsenceController.clear();
        Get.back();
      }
    }
  }

  // delete cellule controller
  void deleteCellule(Absence cellul) {
    isLoading(true);
    AbsenceService.deleteAbsence(cellul.id.toString()).then((res) {
      isLoading(false);
      findAbsenceAll();
      Get.back();
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }

  // Modifier la cellule controller function

  void updateCellules(Absence cellul) {
    isLoading(true);
    AbsenceService.updateAbsence(cellul.id.toString()).then((res) {
      isLoading(false);
      findAbsenceAll();
      Get.back();
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }
}
