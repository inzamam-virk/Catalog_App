import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      color: Colors.deepPurple,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'),
        home: HomePage(),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
          brightness: Brightness.dark
        ),
        routes: {
          Routes.homeRoute : (context)=> HomePage(),
          Routes.loginRoute : (context) => LoginPage()
        },
                );
  }
}
