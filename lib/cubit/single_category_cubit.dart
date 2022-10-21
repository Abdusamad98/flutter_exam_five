import 'package:bloc/bloc.dart';
import 'package:flutter_exam_five/data/repositories/books_repository.dart';
import 'package:meta/meta.dart';

import '../data/models/single.dart';

part 'single_category_state.dart';

class SingleCategoryCubit extends Cubit<SingleCategoryState> {
  SingleCategoryCubit({
    required this.repository
  }) : super(SingleCategoryInitial());
  final Repository repository;
  Future<void>listenCat({required int id})async{
    try{
      var singleCategory= await repository.getCategoryId(id: id);
      emit(GetInSuccess(singleCat: singleCategory));
    }catch(e){
      emit(GetFailure(errorText: e.toString()));
    }
  }
  
}

