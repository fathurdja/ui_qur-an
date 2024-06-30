import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_uiquran/cubit/cubit/surat_cubit.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final suratCubit = context.read<SuratCubit>();
    suratCubit.getSurat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 24.0,
                ),
                const SizedBox(width: 30),
                Text(
                  "Al-Qur'an",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 170),
                const Icon(
                  Icons.search,
                  size: 24.0,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Text(
                "Assalamuaikum",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/Frame30.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
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
                            const SizedBox(width: 10),
                            Text(
                              "Last Read",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
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
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Surah",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Page",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Ayat",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Hijb",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<SuratCubit, SuratState>(
                builder: (context, state) {
                  if (state is SuratLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SuratLoaded) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final surat = state.surat[index];
                        return ListTile(
                          title: Text(
                            surat.nama ?? 'error',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                          ),
                          subtitle: Text(surat.nomor.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(surat.namaLatin ?? "error"),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: state.surat.length,
                    );
                  }
                  return Center(
                    child: Text("text"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
