// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// 
// class AddVisite extends StatefulWidget {
//   const AddVisite({super.key});
// 
//   
// 
//   @override
//   State<AddVisite> createState() => _AddVisiteState();
// }
// 
// class _AddVisiteState extends State<AddVisite> {
//   final _formKey = GlobalKey<FormState>();
//   String? valueChoose;
//   String? newValue;
//   String? valueItem;
//   String? valueChoose2;
//   String? newValue2;
//   String? valueItem2;
// 
//  
// 
// 
//   final List listItem = [
//     "Maison", "Maison1", "Maison2"
//   ];
//   final List listItem2 = [
//     "Respo", "Respo1", "Respo3"
//   ];
//   
// 
// TextEditingController _date = TextEditingController(); 
//   
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(
//           bottom: 100
//         ),
//         child: Form(
//           key: _formKey,
//           child: Column(children: [
//             Container(
//               margin: EdgeInsets.only(
//                 top: 5
//               ),
//               padding: const EdgeInsets.all(10),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                     labelText: 'Fidèle',
//                     hintText: 'Nom du fidèle pré rempli ',
//                     focusColor: Colors.green,
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.green))
//                     // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
//                     ),
//               ),
//             ),
//             Container(
//               // width: double.infinity,
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: DropdownButtonFormField(
//                   hint: Text("Maison de la visite"),
//                   value: valueChoose, 
//                   onChanged: (newValue){
//                     setState(() {
//                       valueChoose = newValue.toString();
//                     });
//                   },
//                   items: listItem.map((valueItem) {
//                       return DropdownMenuItem(
//                         value: valueItem, 
//                         child: Text(valueItem),
//                       );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             Container(
//               // width: double.infinity,
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: DropdownButtonFormField(
//                   hint: Text("Responsable de la visite"),
//                   value: valueChoose2, 
//                   onChanged: (newValue2){
//                     setState(() {
//                       valueChoose2 = newValue2.toString();
//                     });
//                   },
//                   items: listItem2.map((valueItem2) {
//                       return DropdownMenuItem(
//                         value: valueItem2, 
//                         child: Text(valueItem2),
//                       );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                     labelText: 'Nature de la visite',
//                     hintText: 'Entrez la nature de la visite',
//                     focusColor: Colors.green,
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.green))
//                     // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
//                     ),
//               ),
//             ),
//         Container(
//           margin: EdgeInsets.only(
//             top: 10
//           ),
//           padding: const EdgeInsets.all(10),
//           child: TextFormField(
//                  controller: _date,
//                 decoration: const InputDecoration(
//                   icon: Icon(Icons.calendar_today_rounded),
//                 labelText: 'Date',
//                 hintText: "Date de la visite",
//                 focusColor: Colors.green,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green))
//                 // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
//                 ),
//                 onTap: () async{
//                   DateTime? pickeddate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2101));
// 
//                     if( pickeddate != null){
//                       setState(() {
//                         _date.text = DateFormat('dd-MM-yyyy').format(pickeddate);
// 
//                       });
//                     }
//                 },
//           ),
//         ),
//              Container(
//               margin: EdgeInsets.only(
//                 top: 10
//               ),
//               padding: const EdgeInsets.all(10),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                     labelText: 'Rapport de la visite',
//                     hintText: 'Faire le rapport de la visite',
//                     focusColor: Colors.green,
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.green))
//                     // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
//                     ),
//               ),
//             ),
//             
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//               
//                 SizedBox(
//                     width: 150,
//                     child:
//                         ElevatedButton(onPressed: () {}, child: Text("Ajouter"), style: ElevatedButton.styleFrom(
//                           primary: Colors.green
//                         ),)),
//               ],
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddVisite extends StatefulWidget {
  const AddVisite({super.key}); 

  @override
  State<AddVisite> createState() => _AddVisiteState();
  
}


String? valueChoose;
  String? newValue;
  String? valueItem;
  String? valueChoose2;
  String? newValue2;
  String? valueItem2;

 

  final List listItem = [
    "Maison", "Maison1", "Maison2"
  ];
  final List listItem2 = [
    "Respo", "Respo1", "Respo3"
  ];

class _AddVisiteState extends State<AddVisite> {
  final _formKey = GlobalKey<FormState>();
   TextEditingController _date = TextEditingController(); 
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
                labelText: 'Fidèle',
                hintText: 'Nom du Fidèle pré-rempli',
                focusColor: Colors.green,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))
                // border: OutlineInputBorder(borderRadius: Border.symmetric(vertical: ))
                ),
          ),
        ), 
            Container(
              // width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: DropdownButtonFormField(
                  hint: Text("Maison de la visite"),
                  value: valueChoose, 
                  onChanged: (newValue){
                    setState(() {
                      valueChoose = newValue.toString();
                    });
                  },
                  items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem, 
                        child: Text(valueItem),
                      );
                  }).toList(),
                ),
              ),
            ),
            Container(
              // width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: DropdownButtonFormField(
                  hint: Text("Responsable de la visite"),
                  value: valueChoose2, 
                  onChanged: (newValue2){
                    setState(() {
                      valueChoose2 = newValue2.toString();
                    });
                  },
                  items: listItem2.map((valueItem2) {
                      return DropdownMenuItem(
                        value: valueItem2, 
                        child: Text(valueItem2),
                      );
                  }).toList(),
                ),
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
                labelText: 'Nature de la visite',
                hintText: 'Entrer la nature de la visite',
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
                labelText: 'Rapport',
                hintText: 'Entrer le rapport de la visite',
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
                    ElevatedButton(onPressed: () {}, child: Text("Ajouter"), style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),)),
          ],
        ), 
         SizedBox(height: 50,)
      ]),
    );
  }
}
