import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () async {
      Navigator.pushNamedAndRemoveUntil(
          context, '/Dashboard', (route) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Image(image: AssetImage('assets/images/icon_balila.png')),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: const CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
