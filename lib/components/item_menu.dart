import 'package:balila_mobile/model/model_menu.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatefulWidget {
  final ModelMenu item;
  final Icon? iconRight;
  final Function onPress;
  const ItemMenu(
      {Key? key, required this.item, this.iconRight, required this.onPress})
      : super(key: key);

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
            splashColor: Theme.of(context).colorScheme.primary,
            onTap: () => widget.onPress(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(child: Text(widget.item.name)),
                  Container(child: widget.iconRight),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            )),
        color: Colors.transparent,
      ),
      // color: Theme.of(context).colorScheme.onPrimary,
      height: 44.0,
    );
  }
}
