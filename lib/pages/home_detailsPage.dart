// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomePageDetails extends StatelessWidget {
  final Item catalog;
  const HomePageDetails({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.red500.xl4.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black54),
                  ),
                ).wh(100, 50)
              ],
            ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)),
            ),
            Expanded(child: VxArc(
              height: 0.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(children: [
                  catalog.name.text.xl4.bold.make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),

                ]).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
