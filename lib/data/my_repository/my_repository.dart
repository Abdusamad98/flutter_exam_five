import 'package:flutter_exam_five/data/models/category_model.dart';
import 'package:flutter_exam_five/data/models/product_model.dart';
import 'package:flutter_exam_five/data/services/api_provider.dart';

class MyRepository {
  MyRepository({required this.apiProvider});

  ApiProvider apiProvider;

  Future<List<CategoryModel>> getCategories() async => apiProvider.getCategories();

  Future<List<ProductModel>> getProducts({required int id}) async => apiProvider.getProducts(id: id);
}
