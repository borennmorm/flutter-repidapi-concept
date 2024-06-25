import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_ecomerce_app/controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  final ProductController _productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          var product = _productController.product.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.productPhotos[0], // Display the first product photo
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.productTitle,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                product.productDescription,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Product Photos:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.productPhotos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(
                        product.productPhotos[index],
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
