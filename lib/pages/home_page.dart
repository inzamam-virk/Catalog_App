import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          child: Text("This is my App"),
        )
      ),
      drawer: MyDrawer(),
      );
  }
}
