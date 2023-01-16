// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/models/cart.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: "Cart".text.xl2.make(),
        titleSpacing: 110,
      ),
      body: Column(
        children: [Expanded(child: _CartList()), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: ((context, store, status) {
                return Text(
                  "\$${_cart.totalPrice}",
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).accentColor),
                ).w24(context);
              }),
              mutations: {RemoveMutation}),
          WidthBox(20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Buying not yet supported")));
            },
            child: Text(
              "Buy",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).buttonColor,
              ),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
          ).w20(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? Text(
            "Nothing to show",
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 25),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(
                Icons.done,
                color: Theme.of(context).accentColor,
              ),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: (() {
                  RemoveMutation(item: _cart.items[index]);
                }),
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                _cart.items[index].name,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          );
  }
}
