import 'package:flutter_exam_five/data/api_services/api_provider.dart';
import 'package:flutter_exam_five/data/models/product_item.dart';

class MyRepository {
  MyRepository({required this.apiProvider});
  ApiProvider apiProvider;

  Future<List<ProductItem>> getViews() async =>
      apiProvider.getCategoryFields();
}