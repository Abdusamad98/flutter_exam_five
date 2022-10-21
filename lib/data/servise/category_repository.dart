import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/servise/category_client.dart';
import 'package:flutter_exam_five/modeles/category_item.dart';
import 'package:flutter_exam_five/modeles/product_item.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

  Future<List<CategoryItem>> getAllCategories() async {
    Response response = await apiClient.dio.get(apiClient.dio.options.baseUrl);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<CategoryItem> categories = (response.data as List?)?.map((e) => CategoryItem.fromJson(e)).toList() ?? [];
      return categories;
    } else {
      throw Exception();
    }
  }

  Future<List<ProductItem>> getCategoryProducts({required int categoryId}) async {
    Response response = await apiClient.dio.get("${apiClient.dio.options.baseUrl}/$categoryId");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<ProductItem> categProducts = (response.data as List?)?.map((e) => ProductItem.fromJson(e)).toList() ?? [];
      return categProducts;
    } else {
      throw Exception();
    }
  }
}