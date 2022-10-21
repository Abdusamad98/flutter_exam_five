import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/models/category/category_model.dart';
import 'package:flutter_exam_five/data/models/product/product_model.dart';
import 'package:flutter_exam_five/data/services/api/open_api/open_api_client.dart';

class OpenApiService {
  OpenApiService({required OpenApiClient openApiClient})
      : _openApiClient = openApiClient;

  final OpenApiClient _openApiClient;

  Future<List<CategoryModel>> getCategories() async {
    try {
      Response response =
          await _openApiClient.dio.get(_openApiClient.dio.options.baseUrl);
      if (response.statusCode! <= 200 || response.statusCode! <= 299) {
        return (response.data as List?)
                ?.map((category) => CategoryModel.fromJson(category))
                .toList() ??
            [];
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getProductsByCatId({required int id}) async {
    try {
      Response response = await _openApiClient.dio
          .get("${_openApiClient.dio.options.baseUrl}/$id");
      if (response.statusCode! <= 200 || response.statusCode! <= 299) {
        return (response.data as List?)
                ?.map((category) => ProductModel.fromJson(category))
                .toList() ??
            [];
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
