import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/route_manager.dart';
import 'package:lebonberger/layout/AppDrawer.dart';
import 'package:lebonberger/layout/header/BaseAppBar.dart';
import 'package:lebonberger/membres/membre-liste-screen.dart';
import 'package:lebonberger/routes/app.routes.dart';

class MembreScreen extends StatefulWidget {
  const MembreScreen({super.key});

  @override
  State<MembreScreen> createState() => _MembreScreenState();
}

class _MembreScreenState extends State<MembreScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    MembreListeScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Membre'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Membres',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_disabled),
            label: 'En attentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: 'Plus',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 201, 181, 6),
        onTap: _onItemTapped,
      ),
      backgroundColor: Color.fromARGB(255, 241, 241, 239),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
              onPressed: () {
                Get.toNamed(AppRoutes.addMembre);
              },
            )
          : null,
    );
  }
}
