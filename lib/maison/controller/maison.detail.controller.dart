import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/maison/model/maison.model.dart';

import 'package:lebonberger/maison/service/maison.service.dart';

class MaisonDetailController extends GetxController {
  RxBool isLoading = false.obs;

  late List<Maison> maisons = <Maison>[].obs;

  @override
  void onInit() async {
    findOneByMaisonId();
    super.onInit();
  }

  // Methode controller pour Afficher les maisons

  void findOneByMaisonId() async {
    if (Get.arguments != null) {
      dynamic maisonId = Get.arguments.toString();
      MaisonService.findOndById(maisonId).then((maison) {
        isLoading(false);
        maisons.add(maison);
      }).catchError((onError) => print(onError));
    }
  } 

  // Methode pour supprimer une maison : le controller 

  // Supprimer une maison 
  void deleteMaison(Maison id) {
    isLoading(true); 
    MaisonService.deleteMaison(id.id.toString()).then((res) {
      isLoading(false);
      Get.back();
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  } 
}
