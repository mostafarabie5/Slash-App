import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:slash/core/utils/product_model.dart';

class ProductServices {
  Future<Map<String, List<ProductModel>>> jsonLoadFromAssets(
      String filePath) async {
    Map<String, dynamic> json =
        jsonDecode(await rootBundle.loadString(filePath));
    List<String> sections = json.keys.toList();
    Map<String, List<ProductModel>> products = {};
    for (int i = 0; i < sections.length; i++) {
      for (int j = 0; j < json[sections[i]].length; j++) {
        if (products.containsKey(sections[i])) {
          List<ProductModel> listToUpdate = products[sections[i]]!;
          listToUpdate.add(ProductModel.fromJson(json[sections[i]][j]));
        } else {
          ProductModel product = ProductModel.fromJson(json[sections[i]][j]);
          List<ProductModel> listToAdd = [];
          listToAdd.add(product);
          products.addAll({sections[i]: listToAdd});
        }
      }
    }
    return products;
  }
}
