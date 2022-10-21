import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_exam_five/data/models/product/product_model.dart';
import 'package:flutter_exam_five/data/repositories/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository,
        super(ProductsInitial());

  final ProductsRepository _productsRepository;

  void getProductsByCatId({required int id}) async {
    emit(ProductsOnProgress());
    try {
      final products = await _productsRepository.getProductsByCatId(id: id);
      emit(ProductsOnSuccess(products: products));
    } on DioError catch (error) {
      emit(ProductsOnFailure(
        errorText: error.toString(),
      ));
    }
  }
}
