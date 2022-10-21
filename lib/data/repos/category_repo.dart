import 'package:flutter_exam_five/data/models/category/category_item.dart';
import 'package:flutter_exam_five/data/models/product/product_item.dart';
import 'package:flutter_exam_five/data/services/api_services.dart';

class CategoryRepo {
  CategoryRepo({required ApiProvider apiProvider}) : _apiProvider = apiProvider;

  final ApiProvider _apiProvider;

  Future<List<CategoryItem>> getAllCategories() async => _apiProvider.getAllCategories();
  Future<List<ProductItem>> getCategoryProducts({required int id}) async => _apiProvider.getCategoryProducts(categoryId: id);
}
