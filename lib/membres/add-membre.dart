import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:lebonberger/delayed_animation.dart';

class AddMembre extends StatefulWidget {
  const AddMembre({super.key});

  @override
  State<AddMembre> createState() => _AddMembreState();
}

class _AddMembreState extends State<AddMembre> {
  /// ADDED THESE THREE VARIABLES
  final _formKey = GlobalKey<FormState>();
  int index = 0;

  bool goNext = false;
  bool goPrevious = false;

  Widget info(int index) {
    switch (index) {
      case 0:
        return BlochFormWidget1();
      case 1:
        return BlochFormWidget2();
      case 2:
        return Text('Block 3');
      // Here, default corresponds to the index value = 0.
      default:
        return BlochFormWidget1();
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
                                    'TERMINER',
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
  const BlochFormWidget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Civilité',
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
                labelText: 'Sexe',
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
                labelText: 'Profession',
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
                labelText: 'Situation Matrimoniale',
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
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Civilité',
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
                labelText: 'Sexe',
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
                labelText: 'Profession',
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
                labelText: 'Situation Matrimoniale',
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
