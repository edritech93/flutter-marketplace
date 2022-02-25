import 'package:balila_mobile/components/item_product.dart';
import 'package:flutter/material.dart';

import '../model/model_product.dart';

class GridProduct extends StatefulWidget {
  final List<ModelProduct> dataProduct;
  const GridProduct({Key? key, required this.dataProduct}) : super(key: key);

  @override
  State<GridProduct> createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  void _onPressItem(BuildContext context) {
    Navigator.pushNamed(context, '/Product');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Produk Terbaik Untukmu',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemCount: widget.dataProduct.length,
            itemBuilder: (context, index) {
              ModelProduct item = widget.dataProduct[index];
              return ItemProduct(
                  item: item, onPress: () => _onPressItem(context));
            },
          )
        ],
      ),
    );
  }
}
