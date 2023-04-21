import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/model/cellule.model.dart';
import 'package:lebonberger/cellules/service/cellule.service.dart';
import 'package:lebonberger/routes/app.routes.dart';

class CelluleController extends GetxController {
  RxBool isLoading = false.obs;
  // Etape 1 creation des instances
  late List<Cellule> cellules = <Cellule>[].obs;
  late TextEditingController nomCelluleController= TextEditingController();
  var nomCellule = ""; 
  var celluleId = "";

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  



  // Fetch cellule step 2 appel in service the method

  @override 
  void onInit() async {
    findCelluleAll(); 

    nomCelluleController = TextEditingController(); 
    super.onInit();
  }
  
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

  // Modifier la cellule controller function

  void updateCellules(Cellule cellul) {
    isLoading(true); 
    CelluleService.updateCellule(cellul.id.toString()).then((res) {
      isLoading(false);
      findCelluleAll();
      Get.back();
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }
  
  
  
}
