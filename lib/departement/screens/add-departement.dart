import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/departement/controllers/departement.controller.dart';

class AddDepartement extends StatefulWidget {
  const AddDepartement({super.key});

  @override
  State<AddDepartement> createState() => _AddDepartementState();
}

class _AddDepartementState extends State<AddDepartement> { 

  DepartementController controller = Get.put(DepartementController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Ajouter un departement',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Form(
        key: controller.formkey,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Nom du departement',
                  hintText: 'Entrez le nom du departement',
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))
                  // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                  ), 
                  onSaved: (newValue) {
                    controller.nomDepartement = newValue!; 
                  },
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Champs Obligatoire';
                    }
                    return null;
                  },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Type de departement',
                  hintText: 'Entrez le type de departement',
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))
                  // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                  ),  
                   onSaved: (newValue) {
                    controller.typeDepartement = newValue!; 
                  },
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Champs Obligatoire';
                    }
                    return null;
                  },
            ),
          ), 
          const SizedBox(
                height: 50,
              ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.departementSubmit(); 
                    },
                    child: Text("Ajouter", style: GoogleFonts.poppins(fontSize: 18),),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  )),
              
            ],
          )
        ]),
      ),
    ]);
  }
}
