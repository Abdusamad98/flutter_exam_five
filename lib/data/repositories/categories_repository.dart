import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/data/services/api_provider.dart';

class CategoriesRepository {
  CategoriesRepository({required this.apiProvider});
  ApiProvider apiProvider;

  Future<List<CategoryModel>> getAllCategories() async =>
      apiProvider.getAllCategories();

  Future<CategoryModel> getCategoryById(int id) async =>
      apiProvider.getCategoryById(id);
}
