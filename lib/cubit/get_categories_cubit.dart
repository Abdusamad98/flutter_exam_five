import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/data/model/get_categories/get_categories_model.dart';
import 'package:flutter_exam_five/data/repository/categories_repo.dart';
import 'package:flutter_exam_five/data/service/api_provider.dart';
import 'package:formz/formz.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  CategoriesRepository categoriesRepository =
      CategoriesRepository(apiProvider: ApiProvider());
  GetCategoriesCubit()
      : super(const GetCategoriesState(
            categories: [], error: "", status: FormzStatus.pure));

  Future<void> getAllCategories() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      List<GetCategoriesModel> allCategories =
          await categoriesRepository.getAllCategories();
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, categories: allCategories));
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, error: e.toString()));
    }
  }
}
