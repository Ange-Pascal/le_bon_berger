import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/membres/model/membre.model.dart';
import 'package:lebonberger/membres/service/membre.service.dart';

class MembreController extends GetxController {
  late List<Membre> membres = <Membre>[].obs;
  RxBool isLoading = true.obs;
  late TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    findAll();
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
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
}
