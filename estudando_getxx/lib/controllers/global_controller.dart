import 'dart:convert';

import 'package:estudando_getxx/models/product.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];
  List<Product> get products => _products;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("Global onInit");
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/products.json');

    this._products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();
    print("Products");
    update(['products']);
  }

  onFavorite(int index, bool isFavorite){
    Product product = this._products[index];
    product.isFavorite = isFavorite;
    update(['products']);
  }
}
