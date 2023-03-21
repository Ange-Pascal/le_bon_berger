import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/auth/login.service.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: 'LoginPage');
  var obscureText = true.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // ignore: invalid_use_of_protected_member
  }

  void login() async {
    Map<String, dynamic> data = {
      "telephone": "0777952356",
      "password": "admin"
    };

    AuthService.login(data);
  }

  void setObscureText() {
    obscureText(!obscureText.value);
  }
}
