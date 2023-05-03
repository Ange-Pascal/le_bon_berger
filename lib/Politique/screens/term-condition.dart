import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lebonberger/Politique/controller/term.controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:lebonberger/eglise/screens/eglise.login.dart';

class termCondition extends StatelessWidget {
  termCondition({super.key});

  final controller = Get.put(TermController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Termes et conditions'),
        centerTitle: true,
        elevation: 0,
        leading: const Icon(
          Icons.info,
        ),
      ),
      body: Stack(children: [
        Container(
            child: Obx(
          () => Stepper(
            type: StepperType.horizontal,
            steps: buildStep(),
            currentStep: controller.currentStep.value,
            onStepContinue: () {
              if (controller.currentStep.value == buildStep().length - 1 && controller.checkBool.isTrue) {
                print('Message'); 
                Get.to(EgliseLogin());
              } else {
                controller.currentStep.value++;
              }
            },
            onStepCancel: () {
              controller.currentStep.value == 0
                  ? null
                  : controller.currentStep.value--;
            },
            onStepTapped: (index) {
              controller.currentStep.value = index;
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Container(
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      child: Text(
                          controller.currentStep.value == buildStep().length - 1
                              ? 'S\'inscrire'
                              : 'Suivant', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),),
                      onPressed:  controller.currentStep.value == 2  && controller.checkBool.isFalse?null :details.onStepContinue , 
                      
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    if (controller.currentStep.value != 0)
                      Expanded(
                          child: ElevatedButton(
                        child: Text('Retour', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),),
                        onPressed: details.onStepCancel,
                      )),
                  ],
                ),
              );
            },
          ),
        ))
      ]),
    );
  }

  List<Step> buildStep() {
    return [
      Step(
        title: Text(
          'Politique',
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        content: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        isActive: controller.currentStep.value >= 0,
        state: controller.currentStep.value > 0
            ? StepState.complete
            : StepState.indexed,
      ),
      Step(
        title: Text(
          'Termes',
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        content: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        isActive: controller.currentStep.value >= 1,
        state: controller.currentStep.value > 1
            ? StepState.complete
            : StepState.indexed,
      ),
      Step(
        title: Text(
          'Conditions',
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        content: Column(
          children: [
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            CheckboxListTile(
                title: Text(controller.checkBool.isFalse? "Cocher la case ":'Lu et approuvé', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: controller.checkBool.isFalse?Colors.red: Colors.grey),),
                value: controller.checkBool.value,
                onChanged: (value) {
                  controller.checkBool.value = !controller.checkBool.value;
                  print(controller.checkBool.value);
                }, 
                )
          ],
        ),
        isActive: controller.currentStep.value >= 2,
        state: controller.currentStep.value >= 2
            ? StepState.complete
            : StepState.indexed,
      ),
    ];
  }
}
