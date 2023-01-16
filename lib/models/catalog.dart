// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

//get item by ID
  Item getitembyid(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

//Get item by position
  Item getitembyposition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        color: json["color"],
        image: json["image"]
      // userId: json['userId'],
      // // id: json['id'],
      // title: json['title'],
    );
  }

  String toJson() => json.encode(toMap());

  // factory Item.fromJson(String source) =>
  //     Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}


  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //       id: map["id"],
  //       name: map["name"],
  //       desc: map["desc"],
  //       price: map["price"],
  //       color: map["color"],
  //       image: map["image"]);
  // }
  // toMap() => {
  //       "id": id,
  //       "name": name,
  //       "desc": desc,
  //       "price": price,
  //       "color": color,
  //       "image": image,
  //     };
