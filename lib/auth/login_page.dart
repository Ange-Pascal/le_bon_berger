import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/auth/auth.controller.dart';
import 'package:lebonberger/dashboard/services/add-visite.dart';
import 'package:lebonberger/routes/app.routes.dart';
import '../delayed_animation.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController controller = Get.put(AuthController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Votre identifiant",
                    style: GoogleFonts.poppins(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 22),
                  Text(
                    "Utilisez votre adresse email comme identfiant pour vous connecter.",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Form(
              key: controller.loginFormKey,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    DelayedAnimation(
                      delay: 500,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Votre téléphone',
                          labelStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer votre identifiant ou email';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          controller.telephone = newValue!;
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    DelayedAnimation(
                      delay: 500,
                      child: Obx(
                        () => TextFormField(
                          obscureText: controller.obscureText.value,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            labelText: 'Mot de passe',
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                controller.setObscureText();
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Entrer votre mot de passe';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            controller.password = newValue!;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 125),
                    DelayedAnimation(
                      delay: 500,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                            horizontal: 120,
                            vertical: 13,
                          ),
                        ),
                        child: Obx(() {
                          if (controller.isLoading.value == false) {
                            return Text(
                              'CONFIRMER',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          } else {
                            return CircularProgressIndicator(
                              color: Colors.white,
                            );
                          }
                        }),
                        onPressed: () {
                          controller.login();
                          // Get.toNamed(AppRoutes.membre);

                          // if (_formKey.currentState!.validate()) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text('processing data')),
                          //   );
                          // }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    // controller.login();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Passer",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
