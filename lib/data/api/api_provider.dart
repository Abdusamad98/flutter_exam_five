import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/api/api_client.dart';
import 'package:flutter_exam_five/data/models/category_model/categories_model.dart';
import 'package:flutter_exam_five/data/models/products_model/products_models.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

  Future<List<CategoriesModel>> getCategories() async {
    Response response =
    await apiClient.dio.get("${apiClient.dio.options.baseUrl}/categories");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<CategoriesModel> categories = (response.data as List?)
          ?.map((categoriesMap) => CategoriesModel.fromJson(categoriesMap))
          .toList() ??
          [];
      return categories;
    } else {
      throw Exception();
    }
  }

  Future<List<ProductsModel>> getProductsByID({required int id}) async {
    Response response =
    await apiClient.dio.get("${apiClient.dio.options.baseUrl}/categories/$id");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<ProductsModel> products = (response.data as List?)
          ?.map((productsMap) => ProductsModel.fromJson(productsMap))
          .toList() ??
          [];
      return products;
    } else {
      throw Exception();
    }
  }

}