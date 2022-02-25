import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final String title;
  final String? value;
  final Function onChanged;
  const InputPassword(
      {Key? key, required this.title, this.value, required this.onChanged})
      : super(key: key);

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.title,
          suffixIcon: IconButton(
            icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
            tooltip: 'Show/Hide',
            onPressed: () => setState(() {
              isObscure = !isObscure;
            }),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${widget.title} dibutuhkan';
          }
          return null;
        },
        obscureText: isObscure,
        initialValue: widget.value,
        onChanged: (String value) => widget.onChanged(value),
      ),
    );
  }
}
