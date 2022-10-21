import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/models/product_item.dart';
import 'package:flutter_exam_five/data/repository/m_repository.dart';
import 'package:formz/formz.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.myRepository})
      : super(CategoryState(
      errorText: '',
      status: FormzStatus.pure,
      category: []
  ),){
    getAllCategory();
  }
  final MyRepository myRepository;

  void getAllCategory() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var myCategory = await myRepository.getViews();
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
         category: myCategory,

      ));

    }catch(e){
      print(e.toString());
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorText: e.toString()
      ));

    }
  }

}
