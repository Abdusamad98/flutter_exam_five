import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/models/category.dart';

import '../models/single.dart';
import 'api_client.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

// ------------------All ----------------------

  Future<List<CategoryItem>> getAllCategory() async {
    Response response =
        await apiClient.dio.get("${apiClient.dio.options.baseUrl}/categories");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<CategoryItem> category = (response.data  as List?)
              ?.map((e) => CategoryItem.fromJson(e))
              .toList() ??
          [];
      return category;
    } else {
      throw Exception();
    }
  }
// ----------------------------------- Id---------------------
  Future<List<SingleCat>> getCategoryId({required int id}) async {
    Response response = await apiClient.dio
        .get("${apiClient.dio.options.baseUrl}/categories$id");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<SingleCat> singleCat=(response.data as List?)?.map((e) => SingleCat.fromJson(e)).toList() ?? [];
      return singleCat;
    } else {
      throw Exception();
    }
  }


}
