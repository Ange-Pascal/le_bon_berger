import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/cellules/service/cellule.service.dart';

class CelluleController extends GetxController {
  RxBool isLoading = false.obs;
  late List<Cellule> cellules = <Cellule>[].obs;
  TextEditingController nomCelluleEditingController = TextEditingController(); 

  final GlobalKey<FormState> formkey = GlobalKey<FormState>(); 

  var nomCellule = ""; 


  @override
  void onInit() {
    findAll(); 
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose(); 
    nomCelluleEditingController.dispose();
    formkey.currentState?.dispose();
  }

  findAll() async {
    try {
      isLoading(false);
      var res = await CelluleService.flindAll();
      cellules.assignAll(res);
    } catch (e) {
      isLoading(false);
    }
  }

  onSaved() {
    formkey.currentState!.save();
  }


  celluleSubmit() async {
    formkey.currentState!.save();
    // formkey.currentState?.reset();

    if (formkey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "name": nomCellule,
        
      };

      // print(DateFormat('yyyy-MM-dd').format(DateTime.parse("2023/03/07")));
      // convertDateFromString(datenaiss);
      // print(data);

      var res = await CelluleService.create(data);
      // print(res[0]);
      if (res != null && res["statusCode"] == 400) {
        Get.snackbar(
          "Champs Obligatoire",
          res["message"][0].toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        formkey.currentState?.reset();
        Get.toNamed('http://leecka.bptechnology.net/public/index.php/api');
      }
    }
  }

  

}
