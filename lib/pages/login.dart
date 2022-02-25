import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/button_primary.dart';
import '../components/button_secondary.dart';
import '../components/input_password.dart';
import '../components/input_text.dart';
import '../components/loader.dart';
import '../components/notification_alert.dart';
import '../providers/auth.dart';
import '../services/api.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  void _onPressLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showLoader(context);
      Api().login().then((value) {
        context.read<Auth>().setTokenAuth('123qwe', 'qwe123');
      }).catchError((error) {
        showAlert(context: context, message: error);
      }).whenComplete(() => Navigator.pop(context));
    }
  }

  void _onPressRegister(BuildContext context) {
    Navigator.pushNamed(context, '/Register');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    child: const Image(
                      image: AssetImage('assets/images/icon_balila.png'),
                      width: 150,
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 60, 0, 54),
                  ),
                  InputText(
                      title: 'Nomor HP (WA)',
                      onChanged: (String value) => setState(() {
                            username = value;
                          })),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: InputPassword(
                        title: 'Password',
                        onChanged: (String value) => setState(() {
                              password = value;
                            })),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ButtonSecondary(
                              tilte: 'Mendaftar',
                              onPress: () => _onPressRegister(context)),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                            child: ButtonPrimary(
                                tilte: 'Masuk',
                                onPress: () => _onPressLogin(context)))
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
