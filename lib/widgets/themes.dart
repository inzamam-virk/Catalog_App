import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.white,
        canvasColor: Colors.white,
        accentColor: Colors.black87,
        buttonColor: Color.fromARGB(255, 60, 70, 74),
        // floatingActionButtonTheme: ,
        // fontFamily: "lavoda",
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(color: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
        // textTheme: Theme.of(context).textTheme,
        ),
        
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        cardColor: Color.fromARGB(255, 17, 17, 17),
        canvasColor: Color.fromARGB(179, 63, 60, 60),
        accentColor: Colors.white,
        buttonColor: Color.fromARGB(255, 25, 22, 31),
        // Color
        // floatingActionButtonTheme: ,
        // fontFamily: "lavoda",
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 1.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
          // textTheme: Theme.of(context).textTheme,
        ),
      );
}
