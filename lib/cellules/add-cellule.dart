import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/cellules/controller/cellule.controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCellule extends StatefulWidget {
  AddCellule({super.key});

  @override
  State<AddCellule> createState() => _AddCelluleState();
}

class _AddCelluleState extends State<AddCellule> {
  CelluleController controller = Get.put(CelluleController());
  // final _formKey = GlobalKey<FormState>();
  //   TextEditingController nomCellule= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Ajouter une cellule',
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      Form(
        key: controller.formkey,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: controller.nomCelluleController,
              decoration: const InputDecoration(
                labelText: 'Nom de la cellule',
                hintText: 'Entrez le nom de la cellule',
                focusColor: Colors.green,
              ),
              onSaved: (newValue) {
                controller.nomCellule = newValue!;
              },
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Champs obligatoire';
                }
                 return null; 
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 250,
              child: ElevatedButton(
                child: Text('Ajouter'),
                onPressed: () {
                  controller.celluleSubmit();
                },
              ),
            ),
          ]),
        ]),
      ),
    ]);
  }
}
