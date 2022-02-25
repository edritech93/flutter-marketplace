import 'package:flutter/material.dart';

class SimDrawer extends StatelessWidget {
  const SimDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                children: [
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.network(
                          'https://picsum.photos/200',
                          width: 80,
                          height: 80,
                        )),
                    margin: const EdgeInsets.only(bottom: 16),
                  ),
                  const Text('Fulan Bin Fulan',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  const Text('fulan@gmail.com',
                      style: TextStyle(fontSize: 12, color: Colors.white)),
                ],
              )),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/Login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
