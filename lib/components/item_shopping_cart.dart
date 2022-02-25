import 'package:flutter/material.dart';

class ItemShoppingCart extends StatefulWidget {
  const ItemShoppingCart({Key? key}) : super(key: key);

  @override
  _ItemShoppingCartState createState() => _ItemShoppingCartState();
}

class _ItemShoppingCartState extends State<ItemShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: Text('Produk #0001',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          '20 Feb 2022',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Text(
                      'Rp. 250.000',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
