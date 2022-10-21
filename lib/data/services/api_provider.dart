import 'package:flutter_exam_five/data/models/category_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/models/product_model.dart';

class ApiProvider {


  Future<List<CategoryModel>> getCategories() async {
    try {
      Response response =
          await Dio().get('https://third-exam.free.mockoapp.net/categories');
      print(response.data);
      return (response.data as List?)
              ?.map((categories) => CategoryModel.fromJson(categories))
              .toList() ??
          [];
    } catch (e) {
      throw e;
    }
  }

  Future<List<ProductModel>> getProducts({required int id}) async {
    try {
      Response response =
          await Dio().get('https://third-exam.free.mockoapp.net/categories/$id');
          print(response.data);
      var data = (response.data as List?)
              ?.map((products) => ProductModel.fromJson(products))
              .toList() ??
          [];
      return data;
    } catch (e) {
      throw e;
    }
  }
}
