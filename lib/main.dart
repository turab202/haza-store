import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haza_store/screens/home_screen.dart';

void main() {
  runApp(const HazaStoreApp());
}

class HazaStoreApp extends StatelessWidget {
  const HazaStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haza Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}