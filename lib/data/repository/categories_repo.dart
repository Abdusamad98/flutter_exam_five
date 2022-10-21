import 'package:flutter_exam_five/data/model/get_categories/get_categories_model.dart';
import 'package:flutter_exam_five/data/service/api_provider.dart';

class CategoriesRepository {
  ApiProvider apiProvider;
  CategoriesRepository({required this.apiProvider});
  Future<List<GetCategoriesModel>> getAllCategories() =>
      apiProvider.getAllCategories();
}
