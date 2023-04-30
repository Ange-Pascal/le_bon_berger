import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:lebonberger/departement/model/departement.model.dart';
import 'package:lebonberger/departement/service/departement.service.dart'; 

class DepartementController extends GetxController {
  RxBool isLoading = false.obs; 

  late List<Departement> departements = <Departement>[].obs;  
  late TextEditingController nomDepartementController = TextEditingController(); 
  late TextEditingController typeDepartementController = TextEditingController(); 

  var  id = ""; 
  var nomDepartement = ""; 
  var typeDepartement = "";  
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override 
  void onInit() async {
    findDepartementAll();
      
    nomDepartementController = TextEditingController();
    typeDepartementController = TextEditingController(); 
    super.onInit(); 
  }  

// Methode de recuperation et affichage des departements
  void findDepartementAll() {
    isLoading(true); 
    DepartementService.flindAll().then((res) {
      isLoading(false);
      departements.assignAll(departementFromJson(res));
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }


  // Methode d'ajout de departement 

  departementSubmit() async{
    formkey.currentState!.save();
    if(formkey.currentState!.validate()){
      Map<String, dynamic> data = {
        "nom_departement" : nomDepartement, 
        "type_departement" : typeDepartement, 
      };

      var res = await DepartementService.create(data); 
      if (res != null && res["statusCode"] == 400) {
        Get.snackbar(
          "Champs Obligatoire",
          res["message"][0].toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        ); 
        
      } else {
        nomDepartementController.clear();
        typeDepartementController.clear();
        Get.back();
      }
    }
  }

  // Supprimer un departement 

  void deleteDepartement(Departement id) {
    isLoading(true); 
    DepartementService.deleteDepartement(id.id.toString()).then((res) {
      isLoading(false);
      findDepartementAll();
      Get.back();
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  } 
}