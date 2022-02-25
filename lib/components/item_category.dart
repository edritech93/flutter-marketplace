import 'package:balila_mobile/model/model_category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCategory extends StatefulWidget {
  final ModelCategory item;
  final Function onPress;
  const ItemCategory({Key? key, required this.item, required this.onPress})
      : super(key: key);

  @override
  _ItemCategoryState createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          splashColor: Theme.of(context).colorScheme.primary,
          onTap: () => widget.onPress(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.item.url,
                    fit: BoxFit.cover,
                    width: 32.0,
                    height: 32.0,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Text(widget.item.categoryName),
              ],
            ),
          )),
      color: Colors.transparent,
    );
  }
}
