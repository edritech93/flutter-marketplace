import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String title;
  final String? value;
  final Function onChanged;
  const InputText(
      {Key? key, required this.title, this.value, required this.onChanged})
      : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.title,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${widget.title} dibutuhkan';
          }
          return null;
        },
        initialValue: widget.value,
        onChanged: (String value) => widget.onChanged(value),
      ),
    );
  }
}
