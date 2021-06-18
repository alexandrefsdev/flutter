import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/order.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/utils/constants.dart';

class Orders with ChangeNotifier {
  final String _baseUrl = "${Constants.BASE_API_URL}/orders";
  String? _token;
  List<Order> _items = [];
  String? _userId;

  Orders([this._token, this._userId, this._items = const []]);

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadOrders() async {
    List<Order> loadedItems = [];
    final Uri _urlLoad = Uri.parse("$_baseUrl/$_userId.json?auth=$_token");
    final response = await http.get(_urlLoad);
    Map<String, dynamic>? data = json.decode(response.body);

    print(data);

    if (data != null) {
      data.forEach((orderId, orderData) {
        loadedItems.add(
          Order(
            id: orderId,
            date: DateTime.parse(orderData['date']),
            total: orderData['total'],
            products: (orderData['products'] as List<dynamic>).map((item) {
              return CartItem(
                id: item['id'],
                price: item['price'],
                productId: item['productId'],
                quantity: item['quantity'],
                title: item['title'],
              );
            }).toList(),
          ),
        );
      });
      notifyListeners();
    }
    _items = loadedItems.reversed.toList();
    return Future.value();
  }

  Future<void> addOrder(Cart cart) async {
    final Uri _addOrderUrl = Uri.parse("$_baseUrl/$_userId.json?auth=$_token");
    final date = DateTime.now();
    final response = await http.post(
      _addOrderUrl,
      body: json.encode({
        'total': cart.totalAmount,
        // Formato para date mais facil de recuperar no firebase
        'date': date.toIso8601String(),
        'products': cart.items.values
            .map((cartItem) => {
                  'id': cartItem.id,
                  'productId': cartItem.productId,
                  'title': cartItem.title,
                  'quantity': cartItem.quantity,
                  'price': cartItem.price,
                })
            .toList()
      }),
    );
    // Com o response do Post é gerado o ID
    _items.insert(
      0,
      Order(
        id: json.decode(response.body)['name'],
        total: cart.totalAmount,
        date: date,
        products: cart.items.values.toList(),
      ),
    );

    notifyListeners();
  }
}
