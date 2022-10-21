import 'package:bloc/bloc.dart';
import 'package:flutter_exam_five/data/models/product_model/products.dart';
import 'package:flutter_exam_five/data/repostory/category_repostory.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.categoryRepository}) : super(ProductInitial());

  final CategoryRepository categoryRepository;

  Future<void> getAllCategoryProducts({required int id}) async {
    emit(GetProductsInProgress());
    try {
      var categProducts = await categoryRepository.getCategoryById(id: id);
      emit(GetProductsInSuccess(products: categProducts));
    } catch (error) {
      emit(GetProductsInFailure(errorText: error.toString()));
    }
  }
}
