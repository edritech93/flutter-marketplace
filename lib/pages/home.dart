import 'dart:math';

import 'package:balila_mobile/model/model_banner.dart';
import 'package:balila_mobile/model/model_dog.dart';
import 'package:balila_mobile/model/model_product.dart';
import 'package:balila_mobile/services/database.dart';
import 'package:flutter/material.dart';

import '../components/grid_product.dart';
import '../components/grid_product_new.dart';
import '../components/main_carousel.dart';
import '../components/grid_category.dart';
import '../components/second_carousel.dart';
import '../components/title_search.dart';
import '../model/model_category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ModelBanner> listBanner = <ModelBanner>[];
  List<ModelCategory> listCategory = <ModelCategory>[];
  List<ModelProduct> listProductNew = <ModelProduct>[];
  List<ModelProduct> listProduct = <ModelProduct>[];

  @override
  void initState() {
    _getBanner();
    _getCategory();
    _getProductNew();
    _getProduct();
    super.initState();
  }

  void _getBanner() {
    for (var i = 0; i < 3; i++) {
      listBanner.add(ModelBanner(i.toString(), 'https://picsum.photos/200'));
    }
  }

  void _getCategory() {
    for (var i = 0; i < 3; i++) {
      listCategory.add(ModelCategory(
          i.toString(), 'Kategori $i', 'https://picsum.photos/200'));
    }
  }

  void _getProductNew() {
    for (var i = 0; i < 5; i++) {
      listProductNew.add(ModelProduct(
          i.toString(), 'Baru $i', 12000, 'https://picsum.photos/200'));
    }
  }

  void _getProduct() {
    for (var i = 0; i < 10; i++) {
      listProduct.add(ModelProduct(
          i.toString(), 'Produk $i', 13000, 'https://picsum.photos/200'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleSearch(),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Shopping Cart',
            onPressed: () async {
              print(await Database().getDogs());
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Shopping Cart',
            onPressed: () async {
              // Navigator.pushNamed(context, '/ShoppingCart');
              Dog newDog =
                  Dog(id: Random().nextInt(100), name: "Shaggy Dog", age: 10);
              Database().insertDog(newDog);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainCarousel(dataBanner: listBanner),
            GridCategory(dataCategory: listCategory),
            GridProductNew(dataProduct: listProductNew),
            SecondCarousel(),
            GridProduct(dataProduct: listProduct),
          ],
        ),
      ),
    );
  }
}
