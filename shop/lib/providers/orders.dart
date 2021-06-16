import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/order.dart';
import 'package:shop/providers/cart.dart';

class Orders with ChangeNotifier {
  final String _baseUrl =
      "https://flutter-cod3r-30ff4-default-rtdb.firebaseio.com/orders";
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) async {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        date: DateTime.now(),
        products: cart.items.values.toList(),
      ),
    );

    notifyListeners();
  }
}
