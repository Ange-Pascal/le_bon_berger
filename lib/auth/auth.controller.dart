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

  Map<String, dynamic> currentUser = {};

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
        // print(res);
        // String rawJson = '{"name":"Mary","age":30}';
        Get.snackbar("Invalid Credentials 2", res.toString());
        Map<String, dynamic> jsonToken = jsonDecode(res);
        isLoading(false);

        if (jsonToken["statusCode"] == 404) {
          Get.snackbar("Invalid Credentials 1", jsonToken["message"]);
        } else {
          await saveToken(jsonToken["access_token"], jsonToken["current_user"]);
          Get.toNamed(AppRoutes.membre);
        }
      }).catchError((onError) {
        print("echec");
        // print(onError);
        isLoading(false);
        Get.snackbar("Invalid Credentials 2", onError.toString());
      });
    } else {
      isLoading(false);
      Get.snackbar("Invalid Credentials 3", "Champs obligatoire");
    }
  }

  void setObscureText() {
    obscureText(!obscureText.value);
  }

  void logOut() async {
    await removeToken();
    Get.to(const OnBoard());
  }

  getPayload() {
    Map<String, dynamic> user = getCurrentUser();
    // ignore: unnecessary_null_comparison
    if (user != null) {
      return user;
    }
  }
}
