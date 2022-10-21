
import 'package:flutter_exam_five/data/servise/category_repository.dart';
import 'package:flutter_exam_five/modeles/category_item.dart';
import 'package:flutter_exam_five/modeles/product_item.dart';

class CategoryRepo {
  CategoryRepo({required ApiProvider apiProvider}) : _apiProvider = apiProvider;

  final ApiProvider _apiProvider;

  Future<List<CategoryItem>> getAllCategories() async => _apiProvider.getAllCategories();
  Future<List<ProductItem>> getCategoryProducts({required int id}) async => _apiProvider.getCategoryProducts(categoryId: id);
}