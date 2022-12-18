// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/pages/home_detailsPage.dart';
import 'package:flutter_application_2/widgets/drawer.dart';
import 'package:flutter_application_2/widgets/item_widget.dart';
import 'package:flutter_application_2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CatalogModel obj = CatalogModel();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/Catalog.json");
    // print(catalogJson);
    final decoded = jsonDecode(catalogJson);
    var productData = decoded["products"];
    // print(productData);
    CatalogModel.items = List.from(productData)
        .map<Item>((itemm) => Item.fromMap(itemm))
        .toList();
    // print(CatalogModel.items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: MyTheme.,
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              children: [
                MyHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            )),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePageDetails(
                        catalog: catalog,
                      ))),
          child: CatalogItem(catalogg: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalogg;
  const CatalogItem({super.key, required this.catalogg});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalogg.id.toString()),
          child: Image.network(catalogg.image).box.p8.make().p1().w32(context)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalogg.name.text.xl.bold.make(),
            catalogg.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalogg.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black54),
                  ),
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(100).make().py16();
  }
}

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.values[0],
      children: [
        "Catalog App".text.start.xl4.bold.color(Colors.blueAccent[50]).make(),
        "Trending Products".text.xl.make(),
      ],
    );
  }
}
