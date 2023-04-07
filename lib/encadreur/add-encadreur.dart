import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCellule extends StatefulWidget {
  const AddCellule({super.key});

  @override
  State<AddCellule> createState() => _AddCelluleState();
}

class _AddCelluleState extends State<AddCellule> {
  final _formKey = GlobalKey<FormState>();

  String? valueChoose;
  String? newValue;
  String? valueItem;
  final List listItem = [
    "Departement1", "Departement2", "Departement3"
  ];


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
                labelText: 'Nom',
                hintText: 'Entrez le nom de l\'encadreur',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Prénom',
                hintText: 'Entrez le prénom de l\'encadreur',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                ),
          ),
        ),
         Container(
          margin: const EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Numero de téléphone',
                hintText: 'Entrez le numero de l\'encadreur',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Numero de téléphone',
                hintText: 'Entrez le numero de l\'encadreur',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                ),
          ),
        ),
        Container(
              // width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownButtonFormField(
                  hint: const Text("Choisir le departement"),
                  value: valueChoose, 
                  onChanged: (newValue){
                    setState(() {
                      valueChoose = newValue.toString();
                    });
                  },
                  items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem, 
                        child: Text(valueItem),
                      );
                  }).toList(),
                ),
              ),
            ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(
                width: 150,
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Ajouter"), style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),)),
          ],
        )
      ]),
    );
  }
}
