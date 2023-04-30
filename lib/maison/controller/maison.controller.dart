import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lebonberger/maison/model/maison.model.dart';

import '../service/maison.service.dart';

class MaisonController extends GetxController { 
    RxBool isLoading = false.obs; 

    late List<Maison> maisons = <Maison>[].obs; 
    late TextEditingController nomMaisonController = TextEditingController(); 
    late TextEditingController chefDeFamilleController = TextEditingController();  
    late TextEditingController telephoneController = TextEditingController();
    late TextEditingController quartierController = TextEditingController();
    late TextEditingController repereController = TextEditingController();  
    late TextEditingController celluleController = TextEditingController(); 

    var id = ""; 
    var nomMaison = ""; 
    var chefDeFammille = ""; 
    var telephone = ""; 
    var quartier = ""; 
    var repere = "";  
    final GlobalKey<FormState> formkey = GlobalKey<FormState>(); 

    @override 
    void onInit() async {
      
      nomMaisonController = TextEditingController(); 
      chefDeFamilleController = TextEditingController(); 
      telephoneController = TextEditingController(); 
      quartierController = TextEditingController(); 
      repereController = TextEditingController(); 
      celluleController = TextEditingController(); 
      super.onInit();
    } 


    // Methode controller pour Afficher les maisons 

    void findMaisonAll() {
    isLoading(true); 
    MaisonService.flindAll().then((res) {
      isLoading(false);
      maisons.assignAll(maisonFromJson(res));
    }).catchError((onError) {
      isLoading(false);
      print(onError);
    });
  }


    
}
