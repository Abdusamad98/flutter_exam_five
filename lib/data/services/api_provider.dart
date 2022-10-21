import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/data/models/product_model/product_model.dart';
import 'package:flutter_exam_five/data/services/api_client.dart';
import 'package:flutter_exam_five/utils/constants.dart';

class ApiProvider {
  ApiProvider({required this.apiClient});
  ApiClient apiClient;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      Response response = await apiClient.dio.get("$baseUrl$categories");
      if (response.statusCode == HttpStatus.ok) {
        List<CategoryModel> categories = (response.data as List?)
                ?.map((category) => CategoryModel.fromJson(category))
                .toList() ??
            [];
        return categories;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> getProductsByCategoryId(int id) async {
    try {
      Response response = await apiClient.dio.get("$baseUrl$categories/$id");
      if (response.statusCode == HttpStatus.ok) {
        List<ProductModel> products = (response.data as List?)
                ?.map((product) => ProductModel.fromJson(product))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
