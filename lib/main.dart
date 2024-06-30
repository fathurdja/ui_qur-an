import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicing_uiquran/cubit/cubit/surat_cubit.dart';
import 'package:slicing_uiquran/data/api_request.dart';
import 'package:slicing_uiquran/pages/page1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var data = await getSuratData();
  debugPrint(data[0].nama);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SuratCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Al-Qur'an",
        home: DashboardPage(),
      ),
    );
  }
}
