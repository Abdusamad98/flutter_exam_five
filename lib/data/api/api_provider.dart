import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';

class ApiService {
  Future<List<CategoryModel>> getCategoryList() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get(("https://third-exam.free.mockoapp.net/categories"));
      if (response.statusCode == 200) {
        List<CategoryModel> currencyItems = ((response.data) as List?)
                ?.map((e) => CategoryModel.fromJson(e))
                .toList() ??
            [];
        return currencyItems;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
