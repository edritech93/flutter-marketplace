import 'package:balila_mobile/components/item_menu.dart';
import 'package:balila_mobile/components/notification_alert.dart';
import 'package:balila_mobile/model/model_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/configuration.dart';
import 'login.dart';

List<ModelMenu> listMenu = [
  ModelMenu(0, "Mode Tema"),
  ModelMenu(1, "Tentang"),
  ModelMenu(2, "Keluar")
];

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notification',
            onPressed: () {
              Navigator.pushNamed(context, '/Notif');
            },
          ),
        ],
      ),
      body: context.watch<Auth>().isLogin ? const ViewProfile() : const Login(),
    );
  }
}

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  Icon iconTheme = const Icon(Icons.light_mode);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (context.read<Configuration>().themeMode == ThemeMode.dark) {
        setState(() {
          iconTheme = const Icon(Icons.dark_mode);
        });
      } else {
        setState(() {
          iconTheme = const Icon(Icons.light_mode);
        });
      }
    });
  }

  void _onPressTheme(BuildContext context) {
    if (context.read<Configuration>().themeMode == ThemeMode.dark) {
      setState(() {
        iconTheme = const Icon(Icons.light_mode);
      });
      context.read<Configuration>().setThemeMode(ThemeMode.light);
    } else {
      setState(() {
        iconTheme = const Icon(Icons.dark_mode);
      });
      context.read<Configuration>().setThemeMode(ThemeMode.dark);
    }
  }

  void _onPressItem(BuildContext context, ModelMenu item) {
    switch (item.id) {
      case 0:
        _onPressTheme(context);
        break;

      case 1:
        showAlert(context: context, message: "Versi 1.0.0");
        break;

      case 2:
        context.read<Auth>().removeTokenAuth();
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                child: const Image(
                    image: AssetImage('assets/images/icon_balila.png')),
                margin: const EdgeInsets.only(bottom: 16.0),
              ),
              const Text('User',
                  style:
                      TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),
              const Text('user@user.com'),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 44.0),
        ),
        Column(
            children: listMenu.map((item) {
          return ItemMenu(
              item: item,
              iconRight: item.id == 0 ? iconTheme : null,
              onPress: () => _onPressItem(context, item));
        }).toList()),
      ],
    );
  }
}
