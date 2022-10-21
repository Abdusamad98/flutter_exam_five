import 'package:bloc/bloc.dart';
import 'package:flutter_exam_five/data/models/products_model/products_models.dart';
import 'package:flutter_exam_five/data/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.myRepository}) : super(ProductsInitial());

  final MyRepository myRepository;

  Future<void> fetchProductsByID({required int id})async{
    emit(ProductsInProgress());
    try{
      var products = await myRepository.getProducts(id: id);
      emit(ProductsInSuccess(products: products));
    }catch(e){
      emit(ProductsInFailure(errorText: e.toString()));
    }
  }
}
