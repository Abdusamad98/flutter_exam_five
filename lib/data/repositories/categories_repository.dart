import 'package:flutter_exam_five/data/models/category/category_model.dart';
import 'package:flutter_exam_five/data/services/api/open_api/open_api_service.dart';

class CategoriesRepository {
  CategoriesRepository({required OpenApiService openApiService})
      : _openApiService = openApiService;
  final OpenApiService _openApiService;

  Future<List<CategoryModel>> getCategories() async =>
      _openApiService.getCategories();
}