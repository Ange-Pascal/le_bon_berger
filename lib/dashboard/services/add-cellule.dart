import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCellule extends StatefulWidget {
  const AddCellule({super.key});

  @override
  State<AddCellule> createState() => _AddCelluleState();
}

class _AddCelluleState extends State<AddCellule> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Container(
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
          ),
        ),
       
         Container(
          margin: EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Responsable de la cellule',
                hintText: 'Entrez le nom du responsable',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
          ),
        ),
         Container(
          margin: EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Numero du Responsable',
                hintText: 'Entrez le numero',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 150,
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Annuler"), style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ))),
            SizedBox(
              width: 20,
            ),
            SizedBox(
                width: 150,
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Soumettre"), style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),)),
          ],
        )
      ]),
    );
  }
}
