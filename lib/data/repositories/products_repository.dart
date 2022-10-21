import 'package:flutter_exam_five/data/models/product_model/product_model.dart';
import 'package:flutter_exam_five/data/services/api_provider.dart';


class ProductsRepository {
  ProductsRepository({required this.apiProvider});
  ApiProvider apiProvider;
  Future<List<ProductModel>> getProductsByCategoryId(int id) async =>
      apiProvider.getProductsByCategoryId(id);
}
