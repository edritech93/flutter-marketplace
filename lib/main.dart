import 'package:balila_mobile/constants/route_app.dart';
import 'package:balila_mobile/pages/post.dart';
import 'package:balila_mobile/providers/auth.dart';
import 'package:balila_mobile/providers/post.dart';
import 'package:balila_mobile/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/index.dart';
import 'pages/splash.dart';
import 'providers/configuration.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Configuration()),
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
          ).copyWith(
            secondary: Colors.red,
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.grey)),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            backgroundColor: Colors.grey,
          ).copyWith(
            secondary: Colors.yellow,
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        ),
        themeMode: context.watch<Configuration>().themeMode,
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        routes: routeApp);
  }

  @override
  void initState() {
    super.initState();
    _loadConfiguration();
    _loadAuth();
  }

  void _loadAuth() {
    context.read<Auth>().checkTokenAuth();
  }

  void _loadConfiguration() async {
    String? theme = await Storage().getConfigTheme();
    if (theme != null) {
      switch (theme) {
        case 'ThemeMode.light':
          context.read<Configuration>().setThemeMode(ThemeMode.light);
          break;

        case 'ThemeMode.dark':
          context.read<Configuration>().setThemeMode(ThemeMode.dark);
          break;

        default:
          context.read<Configuration>().setThemeMode(ThemeMode.light);
          break;
      }
    } else {
      context.read<Configuration>().setThemeMode(ThemeMode.light);
    }
  }
}
