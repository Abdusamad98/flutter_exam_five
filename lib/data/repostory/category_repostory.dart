import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/data/models/product_model/products.dart';

import '../api/api_provider.dart';

class CategoryRepository {
  CategoryRepository({required ApiProvider apiProvider})
      : _apiProvider = apiProvider;

  final ApiProvider _apiProvider;

  Future<List<CategoryModel>> getAllCategories() async =>
      _apiProvider.getAllCategories();
  Future<List<ProductModel>> getCategoryById({required int id}) async =>
      _apiProvider.getCategoryProducts(categoryId: id);
}
