import 'package:bloc/bloc.dart';
import 'package:flutter_exam_five/data/models/product_model.dart';
import 'package:flutter_exam_five/data/my_repository/my_repository.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required MyRepository myRepository})
      : _myRepository = myRepository,
        super(ProductsInitial());

  final MyRepository _myRepository;

  Future<void> getProducts({required int id}) async {
    emit(ProductsInProgressState());
    try {
      var products = await _myRepository.getProducts(id: id);
      emit(ProductsInSuccessState(products: products));
    } catch (e) {
      emit(ProductsInFailureState(errorText: e.toString()));
    }
  }
}
