import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/models/category.dart';
import 'package:flutter_exam_five/data/repositories/books_repository.dart';
import 'package:formz/formz.dart';

part 'all_category_state.dart';

class AllCategoryCubit extends Cubit<AllCategoryState> {
  AllCategoryCubit({required this.repository}) : super(AllCategoryState(formzStatus: FormzStatus.pure,errorText: "",category: []));
  final Repository repository;
  void getAllCategory()async{
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try{
      var category= await repository.getAllCategory();
      emit(state.copyWith(formzStatus: FormzStatus.submissionSuccess,category: category));
    }catch(error){
      emit(state.copyWith(formzStatus: FormzStatus.submissionFailure, errorText:  "GETALLCATEGORYERRRRR"));
    }
  }
}
