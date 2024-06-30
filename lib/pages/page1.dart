import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Icon(
                Icons.menu,
                size: 24.0,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Al-Qur'an",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 170,
              ),
              const Icon(
                Icons.search,
                size: 24.0,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Icon(
            Icons.arrow_circle_left_outlined,
            size: 40.0,
            color: Colors.green[400],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              "Assalamuaikum",
              style: GoogleFonts.poppins(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
                child: Stack(children: [
              Image.asset("assets/images/Frame30.png"),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.menu_book_sharp,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Last Read",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Al-fatihah",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      "Ayah No: 1",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Surah",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    )),
                Text("Page",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    )),
                Text("Ayah",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    )),
                Text("Hijb",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 35),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                  ),
                  title: const Text("Jessica Doe"),
                  subtitle: const Text("Programmer"),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
