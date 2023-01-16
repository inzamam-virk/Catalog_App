// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/pages/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/models/cart.dart';
import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/pages/home_detailsPage.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CatalogModel obj = CatalogModel();
  final url = "https://api.jsonbin.io/v3/b/63ba9121dfc68e59d57cb285";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final responce = await http.get(Uri.parse(url));
    // if (responce.statusCode == 200) {
    //   // return Item.fromJson(jsonDecode(responce.body));
    // }
    final catalogJson = responce.body;
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/Catalog.json");
    var decoded = json.decode(catalogJson);
    // print(decoded.runtimeType);
    // print(decoded);
    var productData1 = decoded["record"];
    // print(productData1);
    var productData = productData1["products"];
    // print(productData.runtimeType);
    // print(productData);
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    // print(CatalogModel.items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
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
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: ((context, store, status) => FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartRoute);
              },
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
              backgroundColor: Theme.of(context).buttonColor,
            ).badge(color: Colors.blue, size: 15, count: _cart.items.length)),
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
    // print("Network image --->$catalogg.image");
    // print("Network name --->$catalogg.name");
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalogg.id.toString()),
            child:
                Image.network(catalogg.image).box.p8.make().p1().w32(context)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalogg.name.text
                .color(Theme.of(context).accentColor)
                .xl
                .bold
                .make(),
            const SizedBox(
              height: 1,
            ),
            catalogg.desc.text
                .color(Theme.of(context).accentColor)
                .textStyle(context.captionStyle)
                .make(),
            const SizedBox(
              height: 10,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalogg.price}"
                    .text
                    .color(Theme.of(context).accentColor)
                    .bold
                    .xl
                    .make(),
                AddToCart(catalog: catalogg)
              ],
            ).pOnly(right: 8.0).h4(context)
          ],
        ))
      ],
    )).color(Theme.of(context).cardColor).rounded.square(100).make().py16();
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
        Text(
          "Catalog App",
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 35),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Trending Products",
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 15),
        ),
      ],
    );
  }
}
