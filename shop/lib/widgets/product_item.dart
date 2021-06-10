import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  // final Product product;
  // const ProductItem(this.product);
  // Produto deixa de ser recebido no Constructor
  // Passando a ser recebido via provider

  @override
  Widget build(BuildContext context) {
    // Listen false para que a partir deste product não haja notificação, ativando apenas no [CONSUMER] do Icon de favorito
    final Product product = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          // [CONSUMER] é uma alternativa ao [PROVIDER.of()]
          leading: Consumer<Product>(
            // Esse child da função do consumer é constante,
            // nunca muda!
            // child: Text('Nunca muda'),
            builder: (ctx, product, child) => IconButton(
              onPressed: () {
                product.toggleFavorite();
                print(ChangeNotifierProvider.value(value: product));
              },
              color: Theme.of(context).accentColor,
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product);
              print(cart.itemsCount);
            },
          ),
        ),
      ),
    );
  }
}
