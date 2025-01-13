import 'package:flutter/material.dart';
import 'package:lascade_/models/products.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  static const int limit = 5;
  static const url = "https://fakestoreapi.com/products?limit=$limit";

  bool isLoading = true;

  String errorMessage = "";
  String statuscode = "";

  // String errorMessage = "504";
  // String statuscode = "Server Bc";

  // final List products = ProductModel(id: id, title: title, price: price, description: description, category: category, image: image, rating: rating)
  List<ProductModel> products = [];
  getData() async {
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        
        products = productModelFromJson(response.body);

      

      
      } else {
        statuscode = response.statusCode.toString();
        errorMessage = response.reasonPhrase.toString();
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
