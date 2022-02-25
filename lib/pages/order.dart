import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/item_order.dart';
import '../providers/auth.dart';
import 'login.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'History',
            onPressed: () {
              Navigator.pushNamed(context, '/OrderHistory');
            },
          ),
        ],
      ),
      body: context.watch<Auth>().isLogin ? const ViewOrder() : const Login(),
    );
  }
}

class ViewOrder extends StatelessWidget {
  const ViewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const ItemOrder();
        });
  }
}
