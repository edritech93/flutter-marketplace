import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/button_primary.dart';
import '../components/item_shopping_cart.dart';
import '../providers/auth.dart';
import 'login.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: Container(
        child: context.watch<Auth>().isLogin
            ? const ViewShoppingCart()
            : const Login(),
      ),
    );
  }
}

class ViewShoppingCart extends StatelessWidget {
  const ViewShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onPressBuy(BuildContext context) {}

    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return const ItemShoppingCart();
                })),
        Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonPrimary(
                  tilte: 'Bayar', onPress: () => _onPressBuy(context)),
            ))
      ],
    );
  }
}
