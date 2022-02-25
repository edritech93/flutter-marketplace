import 'package:balila_mobile/components/item_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import 'login.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
      ),
      body: context.watch<Auth>().isLogin
          ? const ViewOrderHistory()
          : const Login(),
    );
  }
}

class ViewOrderHistory extends StatelessWidget {
  const ViewOrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return const ItemOrder();
        });
  }
}
