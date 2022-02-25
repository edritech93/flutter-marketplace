import 'package:balila_mobile/components/item_product.dart';
import 'package:flutter/material.dart';

import '../model/model_product.dart';

class GridProductNew extends StatefulWidget {
  final List<ModelProduct> dataProduct;
  const GridProductNew({Key? key, required this.dataProduct}) : super(key: key);

  @override
  State<GridProductNew> createState() => _GridProductNewState();
}

class _GridProductNewState extends State<GridProductNew> {
  void _onPressItem(BuildContext context) {
    Navigator.pushNamed(context, '/Product');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(16, 0, 16.0, 8.0),
            child: Text(
              'Produk Terbaru',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              itemCount: widget.dataProduct.length,
              itemBuilder: (context, index) {
                ModelProduct item = widget.dataProduct[index];
                return ItemProduct(
                    item: item, onPress: () => _onPressItem(context));
              },
            ),
          ),
        ],
      ),
    );
  }
}
