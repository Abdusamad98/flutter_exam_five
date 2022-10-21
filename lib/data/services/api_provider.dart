import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
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

  Future<CategoryModel> getCategoryById(int id) async {
    try {
      Response response = await apiClient.dio.get("$baseUrl$categories/$id");
      if (response.statusCode == HttpStatus.ok) {
        return CategoryModel.fromJson(response.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
