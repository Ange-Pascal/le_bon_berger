import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lebonberger/layout/AppDrawer.dart';
import 'package:lebonberger/layout/header/BaseAppBar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(title: Text('Tablaeu de bord')),
      body: Center(
        child: Text("Tableau de bord"),
      ),
      drawer: AppDrawer(),
    );
  }
}
