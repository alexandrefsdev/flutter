import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/constants.dart';

// [CUIDA DA LISTA DE PRODUTOS DA APP]
// Vai ficar escutando qualquer alteração
class Products with ChangeNotifier {
  final String _baseUrl = "${Constants.BASE_API_URL}/products";
  // List<Product> _items = DUMMY_PRODUCTS;
  List<Product> _items = [];
  String? _token;
  String? _userId;

  Products([this._token, this._userId, this._items = const []]);
  // Esse operador spread faz uma copia da lista
  // [BOA PRATICA] para evitar que mexam na lista principal
  List<Product> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  Future<void> loadProducts() async {
    final Uri _urlLoad = Uri.parse("${_baseUrl}.json?auth=$_token");
    final response = await http.get(_urlLoad);
    Map<String, dynamic>? data = json.decode(response.body);

    final Uri _urlFavorite = Uri.parse(
        "${Constants.BASE_API_URL}/userFavorites/$_userId.json?auth=$_token");

    final favoriteResponse = await http.get(_urlFavorite);
    final favoriteMap = json.decode(favoriteResponse.body);

    _items.clear();
    if (data != null) {
      data.forEach((productId, productData) {
        final isFavorite =
            favoriteMap == null ? false : favoriteMap[productId] ?? false;
        _items.add(Product(
          id: productId,
          title: productData['title'],
          description: productData['description'],
          price: productData['price'],
          imageUrl: productData['imageUrl'],
          isFavorite: isFavorite,
        ));
      });
      notifyListeners();
      return Future.value();
    }
  }

  // ao adicionar produtos, há uma mudança na lista.
  // portanto, é chamado o notifyListeners para "avisar"
  // da alteração
  Future<void> addProduct(Product newProduct) async {
    final Uri _urlAdd = Uri.parse("${_baseUrl}.json?auth=$_token");

    final response = await http.post(
      _urlAdd,
      body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'price': newProduct.price,
        'imageUrl': newProduct.imageUrl,
      }),
    );
    _items.add(
      Product(
        id: json.decode(response.body)['name'],
        title: newProduct.title,
        description: newProduct.description,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl,
      ),
    );
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    if (product == null || product.id == null) {
      return;
    }
    // Percorre toda a lista de produtos para encontrar o produto e realizar o update
    final index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      final Uri _urlUpdate =
          Uri.parse("${_baseUrl}/${product.id}.json?auth=$_token");
      await http.patch(
        _urlUpdate,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
        }),
      );
      _items[index] = product;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final index = _items.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      final product = _items[index];
      final Uri _urlDelete =
          Uri.parse("${_baseUrl}/${product.id}.json?auth=$_token");
      _items.remove(product);
      notifyListeners();

      final response = await http.delete(_urlDelete);

      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException('Ocorreu um erro na exclusão do produto.');
      }
      // else {
      //   _items.remove(product);
      //   notifyListeners();
      // }
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