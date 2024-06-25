import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl =
      'https://real-time-product-search.p.rapidapi.com';

  static const Map<String, String> headers = {
    'x-rapidapi-key': 'd11d03c2a1msh7a31757f3b94f24p109cfdjsn370db68403cf',
    'x-rapidapi-host': 'real-time-product-search.p.rapidapi.com',
  };

  Future<Map<String, dynamic>> fetchProductData() async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/search?q=Nike%20shoes&country=us&language=en&limit=30&sort_by=BEST_MATCH&product_condition=ANY&min_rating=ANY'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
