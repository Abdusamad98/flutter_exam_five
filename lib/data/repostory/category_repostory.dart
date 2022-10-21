import 'package:flutter_exam_five/data/api/api_provider.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';

class CategoryRepository {
  CategoryRepository({required this.apiService});

  final ApiService apiService;
  Future<List<CategoryModel>> getAllCategory() async {
    return await apiService.getCategoryList();
  }
}
