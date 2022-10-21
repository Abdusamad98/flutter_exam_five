import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/data/models/product_model/product_model.dart';
import 'package:flutter_exam_five/data/repositories/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productsRepository}) : super(ProductsInitial());
  ProductsRepository productsRepository;

  void fetchProducts(int id) async {
    emit(GetProductsInProgress());
    try {
      List<ProductModel> products =
          await productsRepository.getProductsByCategoryId(id);
      emit(GetProductsInSuccess(products: products));
    } catch (e) {
      emit(GetProductsInFailure(errorText: e.toString()));
    }
  }
}
