import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        home: LoginPage(),
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.grey),
        darkTheme: ThemeData(
          brightness: Brightness.dark
        ),
        routes: {
          // "/" : (context)=> HomePage(),
          "/login" : (context) => LoginPage()
        },
                );
  }
}
