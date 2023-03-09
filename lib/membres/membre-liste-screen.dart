import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lebonberger/membres/components/MembreHeader.dart';

class MembreListeScreen extends StatelessWidget {
  const MembreListeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MembreHeader(),
        Container(
          padding: EdgeInsets.all(15),
          child: Text('Liste des membres'),
        ),
      ],
    );
  }
}
