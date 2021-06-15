import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';
import '../data/dummy_data.dart';

// [CUIDA DA LISTA DE PRODUTOS DA APP]
// Vai ficar escutando qualquer alteração
class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;
  // Esse operador spread faz uma copia da lista
  // [BOA PRATICA] para evitar que mexam na lista principal
  List<Product> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  bool _showFavoriteOnly = false;

  // ao adicionar produtos, há uma mudança na lista.
  // portanto, é chamado o notifyListeners para "avisar"
  // da alteração
  void addProduct(Product newProduct) {
    _items.add(
      Product(
        id: Random().nextDouble().toString(),
        title: newProduct.title,
        description: newProduct.description,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl,
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    if (product == null || product.id == null) {
      return;
    }
    // Percorre toda a lista de produtos para encontrar o produto e realizar o update
    final index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }
}


  // List<Product> get items {
  //   if (_showFavoriteOnly) {
  //     return _items.where((prod) => prod.isFavorite).toList();
  //   }
  //   return [..._items];
  // }

  // bool _showFavoriteOnly = false;
  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }