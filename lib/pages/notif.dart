import 'package:flutter/material.dart';

import '../components/item_notif.dart';

class Notif extends StatelessWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const ItemNotif();
          }),
    );
  }
}
