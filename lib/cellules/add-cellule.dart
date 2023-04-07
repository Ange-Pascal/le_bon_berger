import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/controller/cellule.controller.dart';
import 'package:lebonberger/dashboard/services/add-visite.dart';

class AddCellule extends StatelessWidget {
   AddCellule({super.key}); 
   CelluleController controller = Get.put(CelluleController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Obx(()  {
            return Container(
              margin: EdgeInsets.only(
                top: 10
              ),
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Nom de la cellule',
                    hintText: 'Entrez le nom de la cellule',
                    focusColor: Colors.green,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))
                    // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                    ), 
                    onSaved: (newValue){
                      controller.nomCellule = newValue!;
                    },
              ),
            );
          }
        ),
         
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
            SizedBox(
                width: 200,
                child:
                    ElevatedButton(onPressed: () {
                      controller.celluleSubmit();
                    }, child: Text("Ajouter"), style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),)),
          ],
        )
      ]),
    );
  }
}
