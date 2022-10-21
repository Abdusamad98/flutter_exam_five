import 'package:flutter_exam_five/data/models/category/category_model.dart';
import 'package:flutter_exam_five/services/api/api_service.dart';

class CategoriesRepository {
  CategoriesRepository({required ApiService apiService})
      : _apiService = apiService;
  final ApiService _apiService;

  Future<List<CategoryModel>> getCategories() async =>
      _apiService.getCategories();
}