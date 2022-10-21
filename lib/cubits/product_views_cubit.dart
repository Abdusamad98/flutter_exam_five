import 'package:bloc/bloc.dart';
import 'package:flutter_exam_five/data/models/products/product_model.dart';
import 'package:flutter_exam_five/data/repository/m_repository.dart';
import 'package:meta/meta.dart';

part 'product_views_state.dart';

class ProductViewsCubit extends Cubit<ProductViewsState> {
  ProductViewsCubit({required this.myRepository}) : super(ProductViewsInitial()){
  }

  MyRepository myRepository;

  void fetchData({required int id})async{
    emit(ProductViewsInProgress());
    try{
      List<ProductModel> views = await myRepository.getByCategory(id: id);
      emit(ProductViewsInSuccess(views: views));
    }catch(e){
      emit(ProductViewsInFailure(errorText: e.toString()));
    }
  }
}
