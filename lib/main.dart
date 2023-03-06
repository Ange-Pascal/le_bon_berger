import 'package:flutter/material.dart';
import 'package:lebonberger/home/welcome_page.dart';
import 'package:lebonberger/screens/membres/navbar_membre.dart';
import 'package:lebonberger/screens/membres/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Le Bon Berger',
      debugShowCheckedModeBanner: false,
       home: WelcomePage()
      // Scaffold(
      //   //drawer: WelcomeMembre(),
      //   appBar: AppBar(
      //     toolbarHeight: 100,
      //     title: const Text('Le Bon Berger'),
      //   ),
      //   body: Center(), 
      // ),
    );
  }
}
