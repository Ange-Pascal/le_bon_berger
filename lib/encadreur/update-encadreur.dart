import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateEncadreur extends StatefulWidget {
  const UpdateEncadreur({super.key});

  @override
  State<UpdateEncadreur> createState() => _UpdateEncadreurState();
}

class _UpdateEncadreurState extends State<UpdateEncadreur> {
  final _formKey = GlobalKey<FormState>();

  String? valueChoose;
  String? newValue;
  String? valueItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          " Modification des infos",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Container(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.attribution),
                        labelText: 'Nom ',
                        hintText: 'Modifiez le nom de l\'encadreur',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))
                        // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.attribution),
                        labelText: 'Prenom',
                        hintText: 'Modifiez le prenom de l\'encadreur',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))
                        // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'Adresse Email',
                        hintText: 'Modifiez son adresse email',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.numbers),
                        labelText: 'Numero de telephone',
                        hintText: 'Modifiez le numero de l\'encadreur',
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                ),

                // Container(
                //   // width: double.infinity,
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: DropdownButtonFormField(
                //       hint: const Text("Choisir le departement"),
                //       value: valueChoose,
                //       onChanged: (newValue) {
                //         setState(() {
                //           valueChoose = newValue.toString();
                //         });
                //       },
                //       items: listItem.map((valueItem) {
                //         return DropdownMenuItem(
                //           value: valueItem,
                //           child: Text(valueItem),
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Ajouter",
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                        )),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
