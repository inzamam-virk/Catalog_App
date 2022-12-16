import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/widgets/drawer.dart';
import 'package:flutter_application_2/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final CatalogModel obj = CatalogModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app"),
        // backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: obj.items.length,
        itemBuilder: ((context, index) {
          return ItemWidget(item: obj.items[index]);
        }),
      ),
      drawer: MyDrawer(),
    );
  }
}
