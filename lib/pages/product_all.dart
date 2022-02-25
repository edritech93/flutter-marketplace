import 'package:flutter/material.dart';

import '../components/grid_product.dart';
import '../components/title_search.dart';
import '../model/model_product.dart';

class ProductAll extends StatefulWidget {
  const ProductAll({Key? key}) : super(key: key);

  @override
  State<ProductAll> createState() => _ProductAllState();
}

class _ProductAllState extends State<ProductAll> {
  List<ModelProduct> listProduct = <ModelProduct>[];

  @override
  void initState() {
    super.initState();
    _getProduct();
  }

  void _getProduct() {
    for (var i = 0; i < 10; i++) {
      listProduct.add(ModelProduct(
          i.toString(), 'Produk $i', 12000, 'https://picsum.photos/200'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleSearch(),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Shopping Cart',
            onPressed: () {
              Navigator.pushNamed(context, '/ShoppingCart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridProduct(dataProduct: listProduct),
          ],
        ),
      ),
    );
  }
}
