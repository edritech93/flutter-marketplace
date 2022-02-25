import 'package:flutter/material.dart';

class ItemNotif extends StatelessWidget {
  const ItemNotif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(22.0),
                    child: Image.network(
                      'https://picsum.photos/200',
                      width: 44,
                      height: 44,
                    )),
                margin: const EdgeInsets.only(right: 16),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: Text('Judul Notifikasi',
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
                      'deskripsi notifikasi',
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
