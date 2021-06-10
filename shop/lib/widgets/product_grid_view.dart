import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';

class ProductGridView extends StatelessWidget {
  final bool showFavoriteOnly;
  const ProductGridView(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final products = showFavoriteOnly
        ? productsProvider.favoriteItems
        : productsProvider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      // Escutando qualquer alteração no favorite de produto
      // Como os produtos já foram instaciados em DUMMY,
      // o changeNotifier não deve ser o create e sim,
      // ChangeNotifierProvider.value
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i], // <---------
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
