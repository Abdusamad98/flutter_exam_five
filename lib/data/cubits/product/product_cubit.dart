import 'package:bloc/bloc.dart';
import 'package:flutter_exam_five/data/models/product/product_item.dart';
import 'package:flutter_exam_five/data/repos/category_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.myRepo}) : super(ProductInitial());

  final CategoryRepo myRepo;

  Future<void> getAllCategoryProducts({required int id}) async {
    emit(GetProductsInProgress());
    try {
      var categProducts = await myRepo.getCategoryProducts(id: id);
      emit(GetProductsInSuccess(products: categProducts));
    } catch (error) {
      emit(GetProductsInFailure(errorText: error.toString()));
    }
  }
}
