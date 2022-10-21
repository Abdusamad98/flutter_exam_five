import 'package:flutter_exam_five/data/api/api_provider.dart';
import 'package:flutter_exam_five/data/models/category_model/categories_model.dart';
import 'package:flutter_exam_five/data/models/products_model/products_models.dart';

class MyRepository {
  MyRepository({required this.apiProvider});

  ApiProvider apiProvider;

  Future<List<CategoriesModel>> getCategories() => apiProvider.getCategories();
  Future<List<ProductsModel>> getProducts({required int id}) => apiProvider.getProductsByID(id: id);
}