import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/pages/cart_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
void main() {
  runApp(VxState(store: MyStore(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      // color: Colors.deepPurple,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
        home: LoginPage(),
        routes: {
          Routes.homeRoute : (context)=> HomePage(),
          Routes.loginRoute : (context) => LoginPage(),
          Routes.cartRoute: (context) => MyCart()
        },
                );
  }
}
