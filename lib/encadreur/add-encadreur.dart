import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/encadreur/controller/encadreur-add.controller.dart';
import 'package:lebonberger/encadreur/controller/encadreur.controller.dart';

class AddEncadreur extends StatefulWidget {
  const AddEncadreur({super.key});

  @override
  State<AddEncadreur> createState() => _AddEncadreurState();
}

class _AddEncadreurState extends State<AddEncadreur> {
  EncadreurController controller = Get.put(EncadreurController());
  
  EncadreurDetailController _controller = Get.put(EncadreurDetailController());

  final _formKey = GlobalKey<FormState>();

  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Ajouter un encadreur",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Container(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formkey,
              child: Column(children: [
                Obx(
                  () => Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    child: TextFormField( 
                      // initialValue: 'Text',
                      controller: TextEditingController(text: '${_controller.membres[0].name}'),
                      decoration: InputDecoration(
                          icon: Icon(Icons.attribution),
                          labelText: ' Nom',
                          hintText: '${_controller.membres[0].name}',
                          focusColor: Colors.green,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))
                          // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                          ),
                      onSaved: (newValue) {
                        controller.name = newValue!; 
                       
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Obx(() => Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        // initialValue: 'Text' ,
                        controller: TextEditingController(text: '${_controller.membres[0].prenom}'),
                        decoration: InputDecoration(
                            icon: Icon(Icons.attribution),
                            labelText: 'Prenom',
                            hintText: '${_controller.membres[0].prenom}',
                            focusColor: Colors.green,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))
                            // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                            ),
                        onSaved: (newValue) {
                          controller.prenom = newValue!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Champs obligatoire';
                          }
                          return null;
                        },
                      ),
                    )),
                Obx(
                  () => Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      // initialValue: 'Text',
                      controller: TextEditingController(text: '${_controller.membres[0].email}'),
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail),
                          labelText: 'Email',
                          hintText: '${_controller.membres[0].email}',
                          focusColor: Colors.green,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      onSaved: (newValue) {
                        controller.email = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Champs obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                // Obx(
                //   () => Container(
                //     // width: double.infinity,
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: DropdownButtonFormField(
                //         hint: Text("Choisir le membre"),
                //         value: valueChoose,
                //         onChanged: (newValue) {
                //           setState(() {
                //             controller
                //                 .setEncadreurItemValue(newValue.toString());
                //           });
                //         },
                //         items: controller.membres.map((item) {
                //           return DropdownMenuItem(
                //             value: item.id,
                //             child: Text("${item.name}"),
                //           );
                //         }).toList(),
                //         onSaved: (newValue) {
                //           controller.userId.value = newValue.toString();
                //         },
                //       ),
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
                          onPressed: () {
                            controller.encadreurSubmit();
                          },
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
