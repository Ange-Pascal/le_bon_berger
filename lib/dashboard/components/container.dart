import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lebonberger/dashboard/Dashboard.dart';
import 'package:lebonberger/dashboard/components/dashboard_option.dart';
import 'package:lebonberger/dashboard/components/searchbar.dart';
import 'package:lebonberger/dashboard/components/slide_membre.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ContainerDashboard extends StatelessWidget {
  const ContainerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Bienvenue dans  ',
          style: GoogleFonts.poppins(fontSize: 13),
        ),
        Text(
          ' votre tableau de bord ',
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.green),
        ),
        const SizedBox(
          height: 15,
        ),
        SearchBar(),

        SizedBox(
          height: 60,
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                // categories
                SizedBox(
                  height: 45,
                  width: 170,
                  child: Row(children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      child: const Center(
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Membres',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '10',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 45,
                  width: 170,
                  child: Row(children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      child: const Center(
                        child: Icon(
                          Icons.local_fire_department,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Departements',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '10',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 45,
                  width: 170,
                  child: Row(children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      child: const Center(
                        child: Icon(
                          Icons.home_mini,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cellules',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '20',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ]),
        ),
        const SizedBox(
          height: 20,
        ),

        // banners

        Row(
          children: [
            Expanded(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.people_outline_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        CircularPercentIndicator(
                          radius: 20,
                          percent: 0.3,
                          progressColor: Colors.yellow,
                          center: Text('30%'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Vous avez jusqu'à ",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "1000 membres ",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Column(
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.video_call_outlined,
                            size: 50,
                            color: Colors.white,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.remove_red_eye_outlined),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Prédication ",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "50 ",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Les Annonces',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 200,
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 350,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                " Annonces du dimanche dernier",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Flexible(
                                child: Icon(
                              Icons.message,
                              size: 50,
                              color: Colors.white,
                            ))
                          ],
                        ),
                        const SizedBox(
                        height: 30,
                      ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder()),
                                onPressed: () {},
                                child: const Icon(Icons.next_plan)),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "3 annonces",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Pour ce dimanche dernier",
                                  style: GoogleFonts.poppins(fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ), 
                const SizedBox(width: 5,), 
                SizedBox(
                  width: 350,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                " Annonces du dimanche dernier",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Flexible(
                                child: Icon(
                              Icons.message,
                              size: 50,
                              color: Colors.white,
                            ))
                          ],
                        ),
                        const SizedBox(
                        height: 30,
                      ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder()),
                                onPressed: () {},
                                child: const Icon(Icons.next_plan)),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "3 annonces",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Pour ce dimanche dernier",
                                  style: GoogleFonts.poppins(fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5,), 
                SizedBox(
                  width: 350,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                " Annonces du dimanche dernier",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Flexible(
                                child: Icon(
                              Icons.message,
                              size: 50,
                              color: Colors.white,
                            ))
                          ],
                        ),
                        const SizedBox(
                        height: 30,
                      ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder()),
                                onPressed: () {},
                                child: const Icon(Icons.next_plan)),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "3 annonces",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Pour ce dimanche dernier",
                                  style: GoogleFonts.poppins(fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        )
      ]),
    );
  }
}
