import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Stack(children: [
        TextFormField(
          decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 233, 236, 233),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: Colors.green,
                size: 30,
              ),
              hintText: "Recherche",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.green.withOpacity(0.7)
              )
              ),
        ),
        Positioned(
            right: 12,
            bottom: 10,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black45),
              child: const Icon(
                Icons.mic_outlined,
                color: Colors.white,
                size: 25,
              ),
            ))
      ]),
    );
  }
}
