import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';


class SlideMembre extends StatelessWidget {
  const SlideMembre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 300,
            
            padding: EdgeInsets.all(20),
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                )
              ],
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 195, 187, 112)
            ),
            child: Column(
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                      child: const Icon(Icons.people, size: 25, color: Colors.white,)
                      ),
                      CircularPercentIndicator(radius: 20,
                      percent: 0.5,
                      progressColor: Colors.red,
                      center:  Text("50%", style: GoogleFonts.poppins(
                        color: Colors.red, fontSize: 12,
                      ),)

                      )
                    ]
                  ),
                 Text('1000 membres' ,style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.bold
                 ), 
                 
                 ),
                 SizedBox(height: 5,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Ajouter un nouveau membre',style: GoogleFonts.poppins(
                  fontSize: 15,
                 ),),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Icon(Icons.add)),
                 ],)
                 ]),
          
          );
  }
}