import 'package:flutter/material.dart';

Future<String?> showLoader(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
          child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: const CircularProgressIndicator(),
              margin: const EdgeInsets.only(right: 16.0),
            ),
            const Text('Loading...'),
          ],
        ),
      ));
    },
  );
}
