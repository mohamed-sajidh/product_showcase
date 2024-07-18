import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:product_showcase/model/product_model.dart';

class HomeNotifier with ChangeNotifier {
  // late final List<ProductModel> product;
  List<ProductModel> product = [];
  bool loading = false;

  HomeNotifier() {
    print("--------------------");
    init();
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  

  void init() {
    getProduct();
  }

  Future<void> getProduct() async {
    try {
      setLoading(true);

      final response = await Dio().get("https://fakestoreapi.com/products");
      print(response.data);

      if (response.statusCode == 200) {
        product = List<ProductModel>.from(response.data.map((e) => ProductModel.fromJson(e)));
      }
      
    } catch(e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }

}
