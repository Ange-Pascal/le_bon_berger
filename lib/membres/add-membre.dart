import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';
import 'package:lebonberger/delayed_animation.dart';

class AddMembre extends StatefulWidget {
  const AddMembre({super.key});

  @override
  State<AddMembre> createState() => _AddMembreState();
}

class _AddMembreState extends State<AddMembre> {
  /// ADDED THESE THREE VARIABLES
  final _formKey = GlobalKey<FormState>();
  List<String> civilite = <String>['Monsieur', 'Madame', 'Mademoiselle'];
  List<String> sexe = <String>['Masculin', 'Féminin'];
  List<String> classAge = <String>['Enfants', 'Adolescents', 'Adultes'];
  List<String> Maison = <String>['Maison 1', 'Maison 2', 'Maison 3'];
  List<String> Cellule = <String>['Cellule 1', 'Cellule 2', 'Cellule 3'];
  List<String> Departement = <String>[
    'Departement 1',
    'Departement 2',
    'Departement 3'
  ];
  int index = 0;

  bool goNext = false;
  bool goPrevious = false;

  Widget info(int index) {
    switch (index) {
      case 0:
        return BlochFormWidget1(civilite: civilite, sexe: sexe);
      case 1:
        return BlochFormWidget2();
      case 2:
        return BlochFormWidget3(
            classAge: classAge,
            maison: Maison,
            cellule: Cellule,
            departement: Departement);
      // Here, default corresponds to the index value = 0.
      default:
        return BlochFormWidget1(civilite: civilite, sexe: sexe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      NumberStepper(
                        enableNextPreviousButtons: false,
                        numbers: [1, 2, 3],
                        activeStep: index,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(5),
                        child: Form(
                          key: _formKey,
                          child: Container(child: info(index)),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: index == 0
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceBetween,
                        children: [
                          index != 0
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Colors.grey,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                  ),
                                  child: Text(
                                    'PRECEDENT',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      index--;
                                    });
                                  },
                                )
                              : Container(),
                          index != 2
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Colors.green,
                                    padding: index == 0
                                        ? EdgeInsets.symmetric(
                                            horizontal: 120,
                                            vertical: 13,
                                          )
                                        : EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                  ),
                                  child: Text(
                                    'SUIVANT',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      index++;
                                    });
                                  },
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Color.fromARGB(255, 155, 6, 6),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                  ),
                                  child: Text(
                                    'ENREGISTRER',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlochFormWidget1 extends StatelessWidget {
  List<String> civilite;
  List<String> sexe;
  BlochFormWidget1({super.key, required this.civilite, required this.sexe});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DelayedAnimation(
            delay: 500,
            child: Container(
              width: double.infinity,
              height: 60,
              child: DropdownButton(
                value: civilite[0],
                items: civilite
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {},
                isExpanded: true,
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nom',
                icon: Icon(Icons.person),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Prénom(s)',
                icon: Icon(Icons.person),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Téléphone',
                icon: Icon(Icons.phone),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: Container(
              width: double.infinity,
              height: 60,
              child: DropdownButton(
                value: sexe[0],
                items: sexe
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {},
                isExpanded: true,
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date de naissance',
                icon: Icon(Icons.calendar_today),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  // setState(() {
                  //    dateinput.text = formattedDate; //set output date to TextField value.
                  // });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Profession',
                icon: Icon(Icons.work),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlochFormWidget2 extends StatelessWidget {
  const BlochFormWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          DelayedAnimation(
            delay: 500,
            child: Container(
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 226, 225, 225),
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 226, 225, 225),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text(
                'Choisir une Photo',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Situation Matrimoniale',
                icon: Icon(Icons.description),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre Enfants',
                icon: Icon(Icons.person),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Année de convertion',
                icon: Icon(Icons.calendar_today),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  // setState(() {
                  //    dateinput.text = formattedDate; //set output date to TextField value.
                  // });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Année de bapteme d\'eau',
                icon: Icon(Icons.calendar_today),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  // setState(() {
                  //    dateinput.text = formattedDate; //set output date to TextField value.
                  // });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Année de bapoteme du  Saint-Esprit',
                icon: Icon(Icons.calendar_today),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  // setState(() {
                  //    dateinput.text = formattedDate; //set output date to TextField value.
                  // });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BlochFormWidget3 extends StatelessWidget {
  List<String> classAge;
  List<String> cellule;
  List<String> departement;
  List<String> maison;

  BlochFormWidget3({
    super.key,
    required this.classAge,
    required this.cellule,
    required this.departement,
    required this.maison,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DelayedAnimation(
            delay: 500,
            child: Container(
              width: double.infinity,
              height: 60,
              child: DropdownButton(
                value: classAge[0],
                items: classAge
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {},
                isExpanded: true,
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Personne Contact',
                icon: Icon(Icons.person),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date decision',
                icon: Icon(Icons.calendar_today),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  // setState(() {
                  //    dateinput.text = formattedDate; //set output date to TextField value.
                  // });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date arrivée',
                icon: Icon(Icons.calendar_today),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  // setState(() {
                  //    dateinput.text = formattedDate; //set output date to TextField value.
                  // });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: Container(
              width: double.infinity,
              height: 60,
              child: DropdownButton(
                value: maison[0],
                items: maison
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {},
                isExpanded: true,
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: Container(
              width: double.infinity,
              height: 60,
              child: DropdownButton(
                value: cellule[0],
                items: cellule
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {},
                isExpanded: true,
              ),
            ),
          ),
          DelayedAnimation(
            delay: 500,
            child: Container(
              width: double.infinity,
              height: 60,
              child: DropdownButton(
                value: departement[0],
                items: departement
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {},
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
