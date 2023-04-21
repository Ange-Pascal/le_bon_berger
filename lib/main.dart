import 'package:flutter/material.dart';
import 'package:lebonberger/auth/welcome_page.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:lebonberger/onBoard.dart';
import 'package:lebonberger/routes/app.pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Le Bon Berger',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoard(), 
      // home: DashBoardScreen(),
      getPages: AppPages.pages,
    );
  }
}
