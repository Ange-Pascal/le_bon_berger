import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarMembre extends StatelessWidget {
  const NavbarMembre({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Kouadio'),
            accountEmail: Text('kouadio@lebonberger.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/kouadio.jpg',
                    width: 90, height: 90, fit: BoxFit.cover),
              ),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bible.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Cellule'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Notifications'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Deconnexion'),
            onTap: () => null,
          ),
          SizedBox(
            height: 100,
          ),
           ListTile(
            title: Text(
              'A tes résolutions répondra le succès; Sur tes sentiers brillera la lumière',
              style: GoogleFonts.poppins(
                color: Colors.grey, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Job 22 verset 28',
              style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic
              ),
            ),
          )
        ],
      ),
    );
  }
}
