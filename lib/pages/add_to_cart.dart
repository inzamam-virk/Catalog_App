// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/models/cart.dart';
import 'package:http/http.dart' as http;
import '../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  late bool isAdded;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    isAdded = _cart.items.contains(catalog) ? true : false;
    return ElevatedButton(
      onPressed: () {
        if (!isAdded) {
          AddMutation(item: catalog);
        }
      },
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.xs.make(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).buttonColor),
      ),
    );
  }
}
