import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    // Se o item já com est id já tive no carrinho, faça o update
    // somando a quantidade de 1.
    if (_items.containsKey(product.id)) {
      _items.update(product.id as String, (existingItem) {
        return CartItem(
          id: existingItem.id,
          productId: product.id as String,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        );
      });
    } else {
      // [putIfAbsent] inclui se não estiver presente
      _items.putIfAbsent(
        product.id as String,
        () => CartItem(
          id: Random().nextDouble.toString(),
          productId: product.id as String,
          title: product.title,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(productId) {
    if (!_items.containsKey(productId)) {
      return;
    }

    if (_items[productId]!.quantity == 1) {
      _items.remove(productId);
    } else {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          productId: productId,
          title: existingItem.title,
          quantity: existingItem.quantity - 1,
          price: existingItem.price,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
