import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:product_showcase/model/product_model.dart';

class HomeNotifier with ChangeNotifier {
  List<ProductModel> product = [];
  List<dynamic> value = [];
  bool loading = false;

  HomeNotifier() {
    init();
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void resetValues(index) {
    value[index] = 0;
    notifyListeners();
  }

  void minusButton(index) {
    int num = value[index];
    num--;
    value[index] = num;
    notifyListeners();
  }

  void addButton(index) {
    int num = value[index];
    num++;
    value[index] = num;
    notifyListeners();
  }

  void init() {
    getProduct();
  }

  void _syncValueList() {
    if (value.length != product.length) {
      value = List.generate(product.length, (index) => 0);
    }
  }

  Future<void> getProduct() async {
    try {
      setLoading(true);

      final response = await Dio().get("https://fakestoreapi.com/products");

      if (response.statusCode == 200) {
        product = List<ProductModel>.from(
            response.data.map((e) => ProductModel.fromJson(e)));
        _syncValueList();
        notifyListeners();
      }
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }
}
