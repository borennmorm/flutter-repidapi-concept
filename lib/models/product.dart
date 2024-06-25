class Product {
  final String productId;
  final String productTitle;
  final String productDescription;
  final List<String> productPhotos;

  Product({
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPhotos,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productTitle: json['product_title'],
      productDescription: json['product_description'],
      productPhotos: List<String>.from(json['product_photos']),
    );
  }
}
