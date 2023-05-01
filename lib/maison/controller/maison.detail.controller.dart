import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lebonberger/maison/model/maison.model.dart';

import '../service/maison.service.dart';

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
}
