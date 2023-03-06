import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../delayed_animation.dart';
import '../main.dart';




class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
  child: Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DelayedAnimation(
              delay: 1500,
              child: Text(
                "Votre identifiant",
                style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 22),
            DelayedAnimation(
              delay: 2500,
              child: Text(
                "Utilisez votre adresse email comme identfiant pour vous connecter.",
                style: GoogleFonts.poppins(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 35),
      LoginForm(),
      
      SizedBox(height: 90),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 35),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: DelayedAnimation(
              delay: 6500,
              child: Text(
                "Passer",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
),
    );
  }
}


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Votre identifiant',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                validator: (value ) {
                  if(value == null || value.isEmpty){
                    return 'Entrer votre identifiant ou email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 4500,
              child: TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  labelText: 'Mot de passe',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                validator: (value ) {
                  if(value == null || value.isEmpty){
                    return 'Entrer votre mot de passe';
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: 125),
      DelayedAnimation(
        delay: 5500,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.green,
            padding: EdgeInsets.symmetric(
              horizontal: 120,
              vertical: 13,
            ),
          ),
          child: Text(
            'CONFIRMER',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => MyApp(),
            //   ),
            // );

            if (_formKey.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('processing data')),
              );
            }
          },
        ),
      ),
          ],
        ),
      ),
    );
  }
}