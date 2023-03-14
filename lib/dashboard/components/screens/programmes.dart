import 'package:flutter/material.dart';

class ProgrammeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> listProgramme = [
    {
      'Eglise': 'Evangelisation',
      'Jeunesse': 'Journée de la jeunesse',
    },
    {
      'Eglise': 'Edification',
      'Jeunesse': 'Journée de la jeunesse',
    },
    {
      'Eglise': 'Edification',
      'Jeunesse': 'Journée de la jeunesse',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: listProgramme.isEmpty
                ? const Center(
                    child: Text('Aucun programme'),
                  )
                : ListView.builder(
                    itemCount: listProgramme.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(index.toString()),
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$index supprimé')));
                        },
                        child: Container(
                          margin: EdgeInsets.all(30),
                          //width: double.infinity,
                          height: 200,

                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: ClipRRect(
                            child: ListTile(
                              title: Text(listProgramme[index]['Eglise']),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
