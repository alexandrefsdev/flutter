import 'package:estudando_getxx/controllers/global_controller.dart';
import 'package:estudando_getxx/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_) => ListView.builder(
        itemBuilder: (ctx, index) {
          final Product product = _.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("USD ${product.price}"),
            trailing: IconButton(
              onPressed: () => _.onFavorite(index, !product.isFavorite),
              icon: Icon(
                Icons.favorite,
                color: product.isFavorite ? Colors.blue : Colors.grey,
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
