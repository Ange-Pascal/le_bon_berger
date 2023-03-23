import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/auth/auth.controller.dart';
import 'package:lebonberger/auth/login_page.dart';
import 'package:lebonberger/auth/welcome_page.dart';
import 'package:lebonberger/membres/MembreScreen.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());

    return controller.getToken() != null
        ? const MembreScreen()
        : const WelcomePage();
  }
}
