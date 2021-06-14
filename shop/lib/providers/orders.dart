import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/order.dart';

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(List<CartItem> products, double total) {
    final combine = (double t, i) => t + (i.price * i.quantity);
    final total = products.fold(0.0, combine);
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: total,
        date: DateTime.now(),
        products: products,
      ),
    );

    notifyListeners();
  }
}
