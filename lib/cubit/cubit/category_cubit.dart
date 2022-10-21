import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/repostory/category_repostory.dart';
import 'package:formz/formz.dart';

import '../../data/models/category_model/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({
    required this.categoryRepository,
  }) : super(
          const CategoryState(
            categories: [],
            status: FormzStatus.pure,
            errorText: "",
          ),
        ) {
    getAllCategories();
  }

  final CategoryRepository categoryRepository;

  Future<void> getAllCategories() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var categories = await categoryRepository.getAllCategories();
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, categories: categories));
    } catch (error) {
      print(error);
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorText: "GET ALL CATEGORIES ERROR!!!"));
    }
  }
}
