import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/data/repositories/categories_repository.dart';
import 'package:formz/formz.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.categoriesRepository})
      : super(const CategoriesState(
            categories: [], errorText: "", formzStatus: FormzStatus.pure)) {
    fetchAllCategories();
  }
  CategoriesRepository categoriesRepository;

  void fetchAllCategories() async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try {
      List<CategoryModel> categories =
          await categoriesRepository.getAllCategories();
      emit(state.copyWith(
          formzStatus: FormzStatus.submissionSuccess, categories: categories));
    } catch (e) {
      emit(
        state.copyWith(
            errorText: e.toString(),
            formzStatus: FormzStatus.submissionFailure),
      );
    }
  }
}
