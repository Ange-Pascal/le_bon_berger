import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateCellule extends StatefulWidget {
  const UpdateCellule({super.key});

  @override
  State<UpdateCellule> createState() => _UpdateCelluleState();
}

class _UpdateCelluleState extends State<UpdateCellule> {
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
                    ElevatedButton(onPressed: () {}, child: Text("Modifier"), style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),)),
          ],
        )
      ]),
    );
  }
}
