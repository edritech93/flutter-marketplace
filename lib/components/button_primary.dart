import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {
  final String tilte;
  final Function onPress;
  const ButtonPrimary({Key? key, required this.tilte, required this.onPress})
      : super(key: key);

  @override
  _ButtonPrimaryState createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
