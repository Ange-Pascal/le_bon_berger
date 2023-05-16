import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/maison/controller/maison.detail.controller.dart';

class MaisonDetailScreen extends StatelessWidget {
  MaisonDetailScreen({super.key});
  MaisonDetailController controller = Get.put(MaisonDetailController());

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
          padding: EdgeInsets.all(20), 
          child: Obx((){
            if(controller.isLoading == false){
              return Column(
                children: [
                  Stack(children: [
                     Text('Maison'), 
                     SizedBox(width: 20,), 
                     Text('${controller.maisons[0].nomMaison}')
                  ],)
                ],
              );
            } else { return const Center(child: CircularProgressIndicator(),);}
          }),
        ),
      )
    );
  }
}
