import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/maison/model/maison.model.dart';

import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/membres/service/membre.service.dart';

class EncadreurDetailController extends GetxController {
  RxBool isLoading = false.obs;

  late List<Membre> membres = <Membre>[].obs;

  @override
  void onInit() async {
    findOneByMembreId();
    super.onInit();
  }

  /// Methode controller pour Afficher les infos d'un membre a enregistrer comme encadreur

  void findOneByMembreId() async {
    if (Get.arguments != null) {
      dynamic membreId = Get.arguments.toString();
      MembreService.findOndById(membreId).then((membre) {
        isLoading(false);
        membres.add(membre);
      }).catchError((onError) => print(onError));
    }
  } 

  // Methode pour supprimer une maison : le controller 

 
}
