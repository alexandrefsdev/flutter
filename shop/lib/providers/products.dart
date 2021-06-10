import 'package:flutter/widgets.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product.dart';
import '../data/dummy_data.dart';

// [CUIDA DA LISTA DE PRODUTOS DA APP]
// Vai ficar escutando qualquer alteração
class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;
  // Esse operador spread faz uma copia da lista
  // [BOA PRATICA] para evitar que mexam na lista principal
  List<Product> get items => [..._items];
  
  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  bool _showFavoriteOnly = false;

  // ao adicionar produtos, há uma mudança na lista.
  // portanto, é chamado o notifyListeners para "avisar"
  // da alteração
  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
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