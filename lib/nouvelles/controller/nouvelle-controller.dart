import 'package:get/get.dart';
import 'package:lebonberger/nouvelles/model/nouvelle.dart';

class NouvelleController extends GetxController{
  var nouvelles = <Nouvelle>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchNouvelles();
  }
  
  void fetchNouvelles() async{
    await Future.delayed(Duration(seconds: 1)); 
    var nouvelleResult = [
      Nouvelle(
        id: 1, 
        libelleNouvelle: 'Nouvelle test 1',
        dateNouvelle: '11-08-2022', 
        libelleVisite: 'Visite Adeline', 
        typeNouvelle: 'Sortie AOC', 
        maison: 'Maison Coulibaly', 
        enregistreur: ' Diagonnaise Silue'
      ), 
      Nouvelle(
        id: 1, 
        libelleNouvelle: 'Nouvelle test 2',
        dateNouvelle: '12-08-2022', 
        libelleVisite: 'Visite Seri', 
        typeNouvelle: 'Mariage', 
        maison: 'Maison Koffi', 
        enregistreur: ' Diacre Bernard'
      ), 
      Nouvelle(
        id: 1, 
        libelleNouvelle: 'Nouvelle test 3',
        dateNouvelle: '13-08-2022', 
        libelleVisite: 'Visite Nobert', 
        typeNouvelle: 'Presentation bébé', 
        maison: 'Maison Nobert', 
        enregistreur: ' Diacre Bernard'
      ), 
      Nouvelle(
        id: 4, 
        libelleNouvelle: 'Nouvelle test 4',
        dateNouvelle: '14-08-2022', 
        libelleVisite: 'Visite Kouadio', 
        typeNouvelle: 'Presentation marié', 
        maison: 'Maison Kouadio', 
        enregistreur: ' Diacre Konan'
      ), 
    ];

    nouvelles.value = nouvelleResult;
  }

}