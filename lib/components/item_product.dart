import 'package:balila_mobile/model/model_product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemProduct extends StatefulWidget {
  final ModelProduct item;
  final Function onPress;
  const ItemProduct({Key? key, required this.item, required this.onPress})
      : super(key: key);

  @override
  _ItemProductState createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 150.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                boxShadow: const [
                  BoxShadow(color: Colors.grey, spreadRadius: 0.3),
                ],
              ),
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      splashColor: Theme.of(context).colorScheme.primary,
                      onTap: () => widget.onPress(),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.item.url,
                              height: 150.0,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageBuilder: (context, imageProvider) {
                                return Ink.image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          Text(widget.item.productName),
                          Text(
                            'Rp. ${widget.item.productPrice}',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16.0),
                          ),
                        ],
                      ))),
            )));
  }
}

// Material(
//         child: InkWell(
//             splashColor: Theme.of(context).colorScheme.primary,
//             onTap: () => widget.onPress(),
//             child: ))
