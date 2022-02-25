import 'package:flutter/material.dart';

import '../components/button_primary.dart';
import '../components/input_password.dart';
import '../components/input_text.dart';
import '../components/loader.dart';
import '../components/notification_alert.dart';
import '../services/api.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String username = '';
  String password = '';
  String passwordConfirm = '';

  void _onPressRegister(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showLoader(context);
      Api().login().then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      }).catchError((error) {
        Navigator.pop(context);
        showAlert(context: context, message: error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Mendaftar')),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Flexible(
                child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputText(
                              title: 'Nama Lengkap',
                              onChanged: (String value) => setState(() {
                                    fullName = value;
                                  })),
                          InputText(
                              title: 'Nomor HP (WA)',
                              onChanged: (String value) => setState(() {
                                    username = value;
                                  })),
                          InputPassword(
                              title: 'Password',
                              onChanged: (String value) => setState(() {
                                    password = value;
                                  })),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: InputPassword(
                                title: 'Konfirmasi Password',
                                onChanged: (String value) => setState(() {
                                      password = value;
                                    })),
                          ),
                          ButtonPrimary(
                              tilte: 'Mendaftar',
                              onPress: () => _onPressRegister(context))
                        ],
                      )),
                ],
              ),
            ))));
  }
}
