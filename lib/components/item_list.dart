import 'package:flutter/material.dart';

class ItemClocking extends StatelessWidget {
  const ItemClocking({Key? key}) : super(key: key);

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
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      'https://picsum.photos/200',
                      width: 40,
                      height: 40,
                    )),
                margin: const EdgeInsets.only(right: 16),
              ),
              Column(
                children: [
                  Container(
                    child: Text('Employee Name'),
                    margin: EdgeInsets.only(bottom: 4),
                  ),
                  Text('07:15:00', style: TextStyle(fontSize: 24)),
                ],
              )
            ],
          ),
        ));
  }
}
