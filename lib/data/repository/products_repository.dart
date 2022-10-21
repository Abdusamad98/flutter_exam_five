import 'package:flutter_exam_five/data/models/product/product_model.dart';
import 'package:flutter_exam_five/services/api/api_service.dart';

class ProductsRepository {
  ProductsRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<List<ProductModel>> getProductsByCatId({required int id}) async =>
      _apiService.getProductsByCatId(id: id);

  final ApiService _apiService;
}
