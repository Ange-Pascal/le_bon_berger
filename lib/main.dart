import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lebonberger/auth/welcome_page.dart';
import 'package:lebonberger/routes/app.pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Le Bon Berger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      getPages: AppPages.pages,
    );
  }
}
