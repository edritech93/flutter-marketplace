import 'package:balila_mobile/model/model_post.dart';
import 'package:flutter/material.dart';

class ItemPost extends StatefulWidget {
  final ModelPost item;
  const ItemPost({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemPost> createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
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
                      children: [
                        Expanded(
                          child: Text(widget.item.title ?? '',
                              style: const TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          '${widget.item.id}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(
                      widget.item.body ?? '',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
