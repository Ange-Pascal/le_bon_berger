import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lebonberger/dashboard/components/searchbar.dart';
import 'package:lebonberger/dashboard/components/home.dart';
import 'package:lebonberger/layout/AppDrawer.dart';
import 'package:lebonberger/layout/header/BaseAppBar.dart'; 

import 'components/screens/programmes.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const BaseAppBar(title: Text('Tableau de bord')),
      body:  HomeDashboard(),
      drawer: AppDrawer(),
    );
  }
}
