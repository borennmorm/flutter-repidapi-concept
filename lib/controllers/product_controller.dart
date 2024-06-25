import 'package:get/get.dart';
import 'package:little_ecomerce_app/models/product.dart';
import 'package:little_ecomerce_app/services/api_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var product = Product(
    productId: '',
    productTitle: '',
    productDescription: '',
    productPhotos: [],
  ).obs;

  ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var productData = await _apiService.fetchProductData();
      product(Product.fromJson(productData['data'][0]));
    } finally {
      isLoading(false);
    }
  }
}
