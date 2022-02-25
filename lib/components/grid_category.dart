import 'package:flutter/material.dart';

import '../model/model_category.dart';
import 'item_category.dart';

class GridCategory extends StatefulWidget {
  final List<ModelCategory> dataCategory;
  const GridCategory({Key? key, required this.dataCategory}) : super(key: key);

  @override
  State<GridCategory> createState() => _GridCategoryState();
}

class _GridCategoryState extends State<GridCategory> {
  void _onPressItem(BuildContext context, ModelCategory item) {
    Navigator.pushNamed(context, '/ProductAll');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
            child: Text(
              'Kategori',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
            ),
            itemCount: widget.dataCategory.length,
            itemBuilder: (context, index) {
              ModelCategory item = widget.dataCategory[index];
              return ItemCategory(
                item: item,
                onPress: () => _onPressItem(context, item),
              );
            },
          )
        ],
      ),
    );
  }
}
