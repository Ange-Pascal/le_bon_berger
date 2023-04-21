import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/routes/app.routes.dart';
import '../delayed_animation.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: Container(
                  height: 170,
                  child: Image.asset('assets/images/lebonberger.jpeg'),
                ),
              ),
              DelayedAnimation(
                delay: 2500,
                child: Container(
                  height: 400,
                  child: Image.asset('assets/images/berger.png'),
                ),
              ),
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "Je suis le bon berger. je connais mes brebis, et elles me connaissent.",
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.poppins(color: Colors.green, fontSize: 16),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 4500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(13),
                    ),
                    child: Text('COMMENCER'),
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
