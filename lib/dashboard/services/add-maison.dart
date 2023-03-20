import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMaison extends StatefulWidget {
  const AddMaison({super.key});

  @override
  State<AddMaison> createState() => _AddMaisonState();
}

class _AddMaisonState extends State<AddMaison> {
  final _formKey = GlobalKey<FormState>();
  String? valueChoose;
  String? newValue;
  String? valueItem;
  final List listItem = [
    "Cellule1", "Cellule2", "Cellule3"
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 100
        ),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(
                top: 5
              ),
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Nom de la Maison',
                    hintText: 'Entrez le nom de la maison',
                    focusColor: Colors.green,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))
                    // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Chef de Famille',
                    hintText: 'Entrez le chef de famille',
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
                    labelText: 'Repère de la Maison',
                    hintText: 'Entrez votre Répère',
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
                    labelText: 'Réference de la Maison',
                    hintText: 'Entrez la réference de la maison',
                    focusColor: Colors.green,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))
                    // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                    ),
              ),
            ),
            Container(
              // width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: DropdownButtonFormField(
                  hint: Text("Choisir la cellule"),
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
            SizedBox(
              height: 50,
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
        ),
      ),
    );
  }
}
