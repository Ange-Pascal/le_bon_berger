import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class MembreDetail extends StatelessWidget {
  const MembreDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      color: Color.fromARGB(255, 194, 194, 194),
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/users.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  children: [
                    Text(
                      'M. Kouame Kouassi Jean Marc',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(72, 183, 245, 188),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '12/01/2021',
                        style: TextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text('Téléphone'),
                        trailing: Text('07 77 95 23 56'),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text('Email'),
                        trailing: Text('adress@gmail.com'),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(72, 183, 245, 188),
                      child: ListTile(
                        title: Text('Sexe'),
                        trailing: Text('Masculin'),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text('Email'),
                        trailing: Text('adress@gmail.com'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
