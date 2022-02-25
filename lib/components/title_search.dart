import 'package:flutter/material.dart';

class TitleSearch extends StatelessWidget {
  const TitleSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
          hintText: " Cari disini...",
          hintStyle: const TextStyle(fontSize: 16),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {},
          )),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }
}
