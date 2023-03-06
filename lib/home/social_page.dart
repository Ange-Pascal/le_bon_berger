import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/home/login_page.dart';
import '../delayed_animation.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
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
              DelayedAnimation(
                delay: 1000,
                child: Container(
                  height: 280,
                  child: Image.asset('assets/images/church.png'),
                ),
              ),
              DelayedAnimation(
                delay: 1000,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                  child: Column(
                    children: [
                      Text(
                        "Jean 10 verset 11",
                        style: GoogleFonts.poppins(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Je suis le bon berger. Le bon berger donne sa vie pour ses brebis.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DelayedAnimation(
                  delay: 3500,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 40,
                    ),
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, 
                              MaterialPageRoute(builder:
                               (contex) => LoginPage()
                               ));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Colors.green,
                              padding: EdgeInsets.all(13),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:   [
                                Icon(Icons.mail_outline_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('EMAIL' , style: GoogleFonts.poppins(
                                    color: Colors.white, 
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),)
                              ],
                            )), SizedBox(height: 20,),
                            ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Color(0xFF576dff),
                              padding: EdgeInsets.all(13),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(FontAwesomeIcons.facebook),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('FACEBOOK' , style: GoogleFonts.poppins(
                                    color: Colors.white, 
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),)
                              ],
                            )), SizedBox(height: 20,),
                            ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: Colors.white,
                              padding: EdgeInsets.all(13),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Image.asset("assets/images/google.png" , height: 20,),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'GOOGLE' , style: GoogleFonts.poppins(
                                    color: Colors.black, 
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),)
                              ],
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
