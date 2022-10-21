import 'package:flutter_exam_five/data/model/get_categories/get_categories_model.dart';
import 'package:flutter_exam_five/data/model/get_category_by_id/get_category_by_id_model.dart';
import 'package:flutter_exam_five/data/service/api_provider.dart';

class CategoriesRepository {
  ApiProvider apiProvider;
  CategoriesRepository({required this.apiProvider});
  Future<List<GetCategoriesModel>> getAllCategories() =>
      apiProvider.getAllCategories();

  Future<List<GetCategoryByIdModel>> getCategoryById(
          {required int categoryId}) =>
      apiProvider.getCategoryById(categoryId);
}
