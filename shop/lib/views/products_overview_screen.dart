import 'package:flutter/material.dart';
import 'package:shop/widgets/product_item.dart';
import '../data/dummy_data.dart';
import '../models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProduts = DUMMY_PRODUCTS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minha Loja',
          textAlign: TextAlign.center,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProduts.length,
        itemBuilder: (ctx, i) => ProductItem(loadedProduts[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
      ),
    );
  }
}
