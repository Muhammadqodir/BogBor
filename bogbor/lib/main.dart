import 'package:bogbor/cubit/gardens_cubit.dart';
import 'package:bogbor/pages/main_page.dart';
import 'package:bogbor/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GardensCubit>(
      create: (context) => GardensCubit(),
      child: MaterialApp(
        title: 'BogBor',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const MainPage(),
      ),
    );
  }
}