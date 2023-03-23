import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/auth/cache_manager.dart';
import 'package:lebonberger/auth/login.service.dart';
import 'package:lebonberger/auth/user.model.dart';
import 'package:lebonberger/onBoard.dart';
import 'package:lebonberger/routes/app.routes.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthController extends GetxController with CacheManager {
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: 'LoginPage');

  late TextEditingController telephoneController;
  late TextEditingController passwordController;
  var obscureText = true.obs;
  var isLoading = false.obs;
  String telephone = "";
  String password = "";

  @override
  void onReady() {
    // TODO: implement onReady
    telephoneController = TextEditingController();
    passwordController = TextEditingController();
    getPayload();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // ignore: invalid_use_of_protected_member
  }

  void login() async {
    isLoading(true);

    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      Map<String, dynamic> data = {
        "telephone": telephone,
        "password": password
      };

      AuthService.login(data).then((res) async {
        var jsonToken = json.decode(res);
        isLoading(false);

        if (jsonToken["statusCode"] == 404) {
          print("error");
          Get.snackbar("Invalid Credentials", jsonToken["message"]);
        } else {
          print("success");
          // print(jsonToken["statusCode"]);
          await saveToken(jsonToken["access_token"]);
          Get.toNamed(AppRoutes.membre);
        }
      }).catchError((onError) {
        print("echec");
        // print(onError["message"]);
        isLoading(false);
        Get.snackbar("Invalid Credentials", "Champs obligatoire");
      });
    } else {
      isLoading(false);
      Get.snackbar("Invalid Credentials", "Champs obligatoire");
    }
  }

  void setObscureText() {
    obscureText(!obscureText.value);
  }

  void logOut() async {
    await removeToken();
    Get.to(const OnBoard());
  }

  User? getPayload() {
    String? token = getToken();
    if (token != null) {
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      print(payload);
      // return payload;
      return User.fromJson(payload);
    }
  }
}
