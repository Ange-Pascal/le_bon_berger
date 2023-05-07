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
import 'package:lebonberger/encadreur/controller/encadreur.controller.dart';
import 'package:lebonberger/encadreur/model/encadreur.model.dart';
import 'package:lebonberger/encadreur/screens/encadreurList.dart';
import 'package:lebonberger/encadreur/service/encadreur.service.dart';
import 'package:lebonberger/maison/model/maison.model.dart';
import 'package:lebonberger/maison/service/maison.service.dart';
import 'package:lebonberger/membres/MembreScreen.dart';
import 'package:lebonberger/membres/controller/membre.controller.dart';
import 'package:lebonberger/membres/membre-detail.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/membres/service/membre.service.dart';
import 'package:lebonberger/routes/app.routes.dart';

class MembreDetailController extends GetxController {
  late List<Membre> membres = <Membre>[];
  late List<Encadreur> encadreurs = <Encadreur>[];

  RxBool isLoading = true.obs;

  final ImagePicker _picker = ImagePicker();
  // Membre membreDetail = Get.arguments as Membre;

  RxBool isLoadingFile = false.obs;

  @override
  void onInit() async {
    findOneByMembreId();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void takePhoto(String membreId) async {
    isLoading(true);

    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      File file = File(imageFile.path);

      var res = await MembreService.uploadImage(file, membreId);

      if (res != null) {
        Membre membre = membreFromJsonSingle(res);
        membres[0].photo = membre.photo;
        // Get.toNamed(AppRoutes.DetailsMembre, arguments: membre);
        // findAll();
        refreshController();
        isLoading(false);
        Get.back();
      }
    }
  }

  findOneByMembreId() async {
    if (Get.arguments != null) {
      dynamic membreId = Get.arguments.toString();
      MembreService.findOndById(membreId).then((membre) {
        isLoading(false);
        membres.add(membre);
      }).catchError((onError) => print(onError));
      // print(membre);
    }
  }
// Devenir encadreur 

validerEncadreur(Membre membre) async {
    isLoading(true);
    dynamic data = {
      "user_id": membre.id.toString(),
    };
    EncadreurService.validerEncadreur(data).then((res) {
      isLoading(false);
      EncadreurController encadreurController = Get.find();
      encadreurController.findEncadreurAll();
      Get.to(EncadreurList());
    }).catchError((onError) => print(onError));
  }
// 1 compte Actif
// 0 compte Inactif
  activerDesactiverCompte(Membre membre) async {
    isLoading(true);
    dynamic data = {
      "id": membre.id.toString(),
      "isActive": membre.isActive == 0 ? 1 : 0
    };
    MembreService.activerDesactiverCompte(data, membre.id.toString())
        .then((res) {
      isLoading(false);
      membres[0] = res;
      refreshController();
      Get.back(result: true);
    }).catchError((onError) => print(onError));
  }

  validerCreerMembre(Membre membre) {
    isLoading(true);
    dynamic data = {"id": membre.id.toString()};

    MembreService.validerCreerMembre(data).then((res) {
      isLoading(false);
      refreshController();
      Get.toNamed(AppRoutes.membre);
    }).catchError((onError) => print(onError));
  }

  supprimerCompte(Membre membre) {
    isLoading(true);
    dynamic data = membre.id.toString();

    MembreService.supprimerCompte(data).then((res) {
      isLoading(false);
      refreshController();
      Get.toNamed(AppRoutes.membre);
    }).catchError((onError) => print(onError));
    // Get.toNamed(AppRoutes.membre, preventDuplicates: false);
  }

  refreshController() {
    MembreController membreController = Get.find();
    membreController.findAll();
    membreController.flindAllEnAttente();
  }
}
