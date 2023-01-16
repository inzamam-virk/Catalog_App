// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/add_to_cart.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        // iconTheme: IconThemeData(),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.red900.xl4.make(),
                  AddToCart(catalog: catalog)
                ],
              ).p32(),
      ),
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
                color: Theme.of(context).cardColor,
                width: context.screenWidth,
                child: Column(children: [
                  catalog.name.text.color(Theme.of(context).accentColor).xl4.bold.make(),
                  const SizedBox(height: 5,),
                  catalog.desc.text.color(Theme.of(context).accentColor).xl.textStyle(context.captionStyle).make(),

                ]).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
