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

class MembreDetailController extends GetxController {
  late List<Membre> membres = <Membre>[].obs;

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
        isLoading(false);
        Get.back();
      }
    }
  }

  findOneByMembreId() async {
    if (Get.arguments != null) {
      dynamic membreId = Get.arguments.toString();
      Membre membre = await MembreService.findOndById(membreId);
      // print(membre);
      isLoading(false);
      membres.add(membre);
    }
  }

  activerDesactiverCompte(Membre membre) async {
    isLoading(true);
    dynamic data = {
      "id": membre.id.toString(),
      "isActive": membre.isActive == true ? false : true
    };
    MembreService.activerDesactiverCompte(data, membre.id.toString())
        .then((res) {
      isLoading(false);
      membres[0] = res;
      Get.back();
    }).catchError((onError) => print(onError));
  }
}
