import 'package:flutter_exam_five/data/api_services/api_provider.dart';
import 'package:flutter_exam_five/data/models/product_item.dart';
import 'package:flutter_exam_five/data/models/products/product_model.dart';

class MyRepository {
  MyRepository({required this.apiProvider});
  ApiProvider apiProvider;

  Future<List<ProductItem>> getViews() async =>
      apiProvider.getCategoryFields();

  Future<List<ProductModel>> getByCategory({required int id})async =>
      apiProvider.getCategoryByCategory(id: id);

}