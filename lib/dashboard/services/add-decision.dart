import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddDecision extends StatefulWidget {
  const AddDecision({super.key}); 

  @override
  State<AddDecision> createState() => _AddDecisionState();
  
}

class _AddDecisionState extends State<AddDecision> {
  final _formKey = GlobalKey<FormState>();
   TextEditingController _date = TextEditingController(); 
   TextEditingController _date2 = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Container(
          margin: EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Libéllé',
                hintText: 'Entrez le libellé de la décision',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
          ),
        ),
       
         Container(
          margin: EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
                 controller: _date2,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                labelText: 'Date',
                hintText: 'Entrez la date de la décision ',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
                onTap: () async{
                  DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                    if( pickeddate != null){
                      setState(() {
                        _date2.text = DateFormat('dd-MM-yyyy').format(pickeddate);

                      });
                    }
                },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
                 controller: _date,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                labelText: 'Date',
                hintText: "Délai d'exécution",
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
                onTap: () async{
                  DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                    if( pickeddate != null){
                      setState(() {
                        _date.text = DateFormat('dd-MM-yyyy').format(pickeddate);

                      });
                    }
                },
          ),
        ),
         Container(
          margin: EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Assigné à',
                hintText: 'Pré rempli',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Statut',
                hintText: 'Entrer le statut de la décision',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 10
          ),
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: const InputDecoration(
                labelText: 'Commentaire',
                hintText: 'Entrez votre commentaire',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 150,
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Valider"), style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),)),
          ],
        ), 
         SizedBox(height: 50,)
      ]),
    );
  }
}
