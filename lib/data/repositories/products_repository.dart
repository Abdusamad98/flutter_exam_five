import 'package:flutter_exam_five/data/models/product/product_model.dart';
import 'package:flutter_exam_five/data/services/api/open_api/open_api_service.dart';

class ProductsRepository {
  ProductsRepository({required OpenApiService openApiService})
      : _openApiService = openApiService;

  Future<List<ProductModel>> getProductsByCatId({required int id}) async =>
      _openApiService.getProductsByCatId(id: id);

  final OpenApiService _openApiService;
}
