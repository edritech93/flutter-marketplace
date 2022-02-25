import 'package:flutter/material.dart';

import '../pages/dashboard.dart';
import '../pages/login.dart';
import '../pages/notif.dart';
import '../pages/order_history.dart';
import '../pages/product.dart';
import '../pages/product_all.dart';
import '../pages/register.dart';
import '../pages/shopping_cart.dart';
import '../pages/splash.dart';

var routeApp = <String, WidgetBuilder>{
  '/Splash': (BuildContext context) => const Splash(),
  '/Login': (BuildContext context) => const Login(),
  '/Register': (BuildContext context) => const Register(),
  '/Dashboard': (BuildContext context) => const Dashboard(),
  '/ShoppingCart': (BuildContext context) => const ShoppingCart(),
  '/Notif': (BuildContext context) => const Notif(),
  '/ProductAll': (BuildContext context) => const ProductAll(),
  '/Product': (BuildContext context) => const Product(),
  '/OrderHistory': (BuildContext context) => const OrderHistory(),
};
