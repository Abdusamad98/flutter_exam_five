import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/model/get_categories/get_categories_model.dart';
import 'package:flutter_exam_five/data/model/get_category_by_id/get_category_by_id_model.dart';
import 'package:flutter_exam_five/data/service/api_client.dart';

class ApiProvider {
  ApiClient apiClient = ApiClient();
  Future<List<GetCategoriesModel>> getAllCategories() async {
    try {
      Response response = await apiClient.dio
          .get("${apiClient.dio.options.baseUrl}/categories");

      if (response.statusCode == HttpStatus.ok) {
        List<GetCategoriesModel> allCategories = (response.data as List?)
                ?.map((e) => GetCategoriesModel.fromJson(e))
                .toList() ??
            [];
        return allCategories;
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<List<GetCategoryByIdModel>> getCategoryById(int categoryId) async {
    try {
      Response response = await apiClient.dio
          .get("${apiClient.dio.options.baseUrl}/categories/$categoryId");

      if (response.statusCode == HttpStatus.ok) {
        List<GetCategoryByIdModel> category = (response.data as List?)
                ?.map((e) => GetCategoryByIdModel.fromJson(e))
                .toList() ??
            [];
        ;
        return category;
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
