// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_cart/models/catalog.dart';

class CartModel {
  CatalogModel catalog;
  CartModel({
    required this.catalog,
  });

  final List<int> _itemID = [];

  List<Item> get items => _itemID.map((id) => catalog.getByID(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);


  void add(Item item) {
    _itemID.add(item.id);
  }

void remove(Item item) {
    _itemID.remove(item.id);
  }



}
