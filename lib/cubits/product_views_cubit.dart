import 'package:bloc/bloc.dart';
import 'package:flutter_exam_five/data/models/product_item.dart';
import 'package:flutter_exam_five/data/repository/m_repository.dart';
import 'package:meta/meta.dart';

part 'product_views_state.dart';

class ProductViewsCubit extends Cubit<ProductViewsState> {
  ProductViewsCubit({required this.myRepository}) : super(ProductViewsInitial()){
    fetchData();
  }

  MyRepository myRepository;

  void fetchData()async{
    emit(ProductViewsInProgress());
    try{
      List<ProductItem> views = await myRepository.getViews();
      emit(ProductViewsInSuccess(views: views));
    }catch(e){
      emit(ProductViewsInFailure(errorText: e.toString()));
    }
  }
}
