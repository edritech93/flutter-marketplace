import 'package:flutter/material.dart';

class ButtonSecondary extends StatefulWidget {
  final String tilte;
  final Function onPress;
  const ButtonSecondary({Key? key, required this.tilte, required this.onPress})
      : super(key: key);

  @override
  _ButtonSecondaryState createState() => _ButtonSecondaryState();
}

class _ButtonSecondaryState extends State<ButtonSecondary> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: (() => widget.onPress()),
        child: Text(
          widget.tilte,
          style: const TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ));
  }
}
