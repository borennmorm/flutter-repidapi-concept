import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_ecomerce_app/views/product_view.dart';
import 'package:little_ecomerce_app/controllers/product_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetBuilder<ProductController>(
        init: ProductController(),
        builder: (_) => ProductView(),
      ),
    );
  }
}
