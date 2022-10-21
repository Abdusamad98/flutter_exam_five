import 'package:flutter_exam_five/data/models/product_item.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:flutter_exam_five/data/models/products/product_model.dart';


class ApiProvider {
  Future<List<ProductItem>> getCategoryFields() async {
    var dio = Dio();
    try {
      Response response = await dio.get("https://third-exam.free.mockoapp.net/categories");

      if (response.statusCode == HttpStatus.ok) {
        // debugPrint(response.data);
        return (response.data as List?)?.map((e) => ProductItem.fromJson(e)).toList() ?? [];
      }else {
        return [];
      }
    } catch (error) {
      throw Exception(error);
    }
  }
  Future<List<ProductModel>> getCategoryByCategory({required int id}) async {
    var dio = Dio();
    try {
      Response response = await dio.get("https://third-exam.free.mockoapp.net/categories/$id");

      if (response.statusCode == HttpStatus.ok) {
        // debugPrint(response.data);
        return (response.data as List?)?.map((e) => ProductModel.fromJson(e)).toList() ?? [];
      }else {
        return [];
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}