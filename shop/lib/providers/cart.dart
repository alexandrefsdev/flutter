import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/providers/cart_item.dart';
import 'package:shop/providers/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  void addItem(Product product) {
    // Se o item já com est id já tive no carrinho, faça o update
    // somando a quantidade de 1.
    if (_items.containsKey(product.id)) {
      items.update(product.id, (existingItem) {
        return CartItem(
            id: existingItem.id,
            title: existingItem.title,
            quantity: existingItem.quantity + 1,
            price: existingItem.price);
      });
    } else {
      // [putIfAbsent] inclui se não estiver presente
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble.toString(),
          title: product.title,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }
}
