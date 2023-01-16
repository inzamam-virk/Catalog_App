// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_2/core/store.dart';
import 'package:flutter_application_2/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  //Store ids of items in cart
  final List<int> _ids = [];

  //Get catalog
  CatalogModel get catalog {
    return _catalog;
  }

  //Set _catalog value
  set catalog(CatalogModel newCatalog) {
    // assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items List
  List<Item> get items {
    return _ids.map((id) => _catalog.getitembyid(id)).toList();
  }

  //Total price
  num get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store!.cart._ids.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation({
    required this.item,
  });

  @override
  perform() {
    store!.cart._ids.remove(item.id);
  }
}
