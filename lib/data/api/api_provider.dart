import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/data/models/product_model/products.dart';
import 'api_client.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

  Future<List<CategoryModel>> getAllCategories() async {
    Response response = await apiClient.dio.get(apiClient.dio.options.baseUrl);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<CategoryModel> categories = (response.data as List?)
              ?.map((e) => CategoryModel.fromJson(e))
              .toList() ??
          [];
      return categories;
    } else {
      throw Exception();
    }
  }

  Future<List<ProductModel>> getCategoryProducts(
      {required int categoryId}) async {
    Response response =
        await apiClient.dio.get("${apiClient.dio.options.baseUrl}/$categoryId");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<ProductModel> categoryProducts = (response.data as List?)
              ?.map((e) => ProductModel.fromJson(e))
              .toList() ??
          [];
      return categoryProducts;
    } else {
      throw Exception();
    }
  }
}
