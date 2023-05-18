import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/auth/Token.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/cellules/service/cellule.service.dart';
import 'package:lebonberger/routes/api.routes.dart';
import 'package:http/http.dart' as http;

class CelluleController extends GetxController {
  RxBool isLoading = false.obs;
  // Etape 1 creation des instances
  late List<Cellule> cellules = <Cellule>[].obs;
  late TextEditingController nomCelluleController= TextEditingController();
  var nomCellule = "";
  var cell= "";

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  



  // Fetch cellule step 2 appel in service the method

  @override 
  void onInit() async {
    findCelluleAll();  

    nomCelluleController = TextEditingController(); 
    super.onInit();
  }
  // fetch cellule controller
  void findCelluleAll() {
    isLoading(true); 
    CelluleService.flindAll().then((res) {
      isLoading(false);
      cellules.assignAll(celluleFromJson(res));
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }


  // controller pour ajout de cellule 
  
  celluleSubmit() async{
    formkey.currentState!.save();
    if(formkey.currentState!.validate()){
      Map<String, dynamic> data = {
        "nom_cellule" : nomCellule,
      };

      var res = await CelluleService.create(data); 
      if (res != null && res["statusCode"] == 400) {
        Get.snackbar(
          "Champs Obligatoire",
          res["message"][0].toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        ); 
        
      } else {
        nomCelluleController.clear();
        Get.back();
      }
    }
  }
  // delete cellule controller
  void deleteCellule(Cellule cellul) {
    isLoading(true); 
    CelluleService.deleteCellule(cellul.id.toString()).then((res) {
      isLoading(false);
      findCelluleAll();
      Get.back();
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }  

  // 
//   void updateCellule(Cellule cellul) {  
// 
//     isLoading(true);  
//     Map<String, dynamic> data = {
//         "nom_cellule" : nomCellule,
//       };
//     CelluleService.updateCellules(cellul.id.toString()).then((res) {
//       isLoading(false);
//       findCelluleAll();
//       Get.back();
//     }).catchError((onError) {
//       isLoading(false);
//       print(onError);
//     });
//   } 

  // Modifier la cellule controller function

  updateCellule(Cellule celluleId) async {
    formkey.currentState!.save();
    if(formkey.currentState!.validate()){
      Map<String, String> data = {
        "nom_cellule" : nomCellule,
      };

      var res = await CelluleService.updateCellules(data, celluleId.id.toString()); 
      if (res != null && res["statusCode"] == 200) {
        Get.snackbar(
          "Cellule modifiée",
          res["message"][0].toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        ); 
        
      } else {
        nomCelluleController.clear();
        Get.back();
      }
    }
  }
  
  
}
