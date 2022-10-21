import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/models/category_model.dart';
import 'package:flutter_exam_five/data/my_repository/my_repository.dart';
import 'package:formz/formz.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required MyRepository myRepository}) :  _myRepository = myRepository ,super(const CategoriesState(categories: [])){
    getCategoreies();
  }

  final MyRepository _myRepository;


  Future<void> getCategoreies()async{
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try{
      var categories = await _myRepository.getCategories();
      emit(state.copyWith(status: FormzStatus.submissionSuccess, categories: categories));
    }catch (e){
      emit(state.copyWith(status: FormzStatus.submissionInProgress, errorText: e.toString()));
    }
  }
}
