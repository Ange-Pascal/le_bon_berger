import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/absence/model/absence.model.dart';
import 'package:lebonberger/absence/services/absence.service.dart';


class AbsenceDetailController extends GetxController {
  RxBool isLoading = false.obs;

  late List<Absence> absences = <Absence>[].obs;

  @override
  void onInit() async {
    findOneByMaisonId();
    super.onInit();
  }

  // Methode controller pour Afficher les maisons

  void findOneByMaisonId() async {
    if (Get.arguments != null) {
      dynamic absenceId = Get.arguments.toString();
      AbsenceService.findOndById(absenceId).then((absence) {
        isLoading(false);
        absences.add(absence);
      }).catchError((onError) => print(onError));
    }
  } 

  // Methode pour supprimer une maison : le controller 

  // Supprimer une maison 
  void deleteMaison(Absence id) {
    isLoading(true); 
    AbsenceService.deleteAbsence(id.id.toString()).then((res) {
      isLoading(false);
      Get.back();
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  } 
}
