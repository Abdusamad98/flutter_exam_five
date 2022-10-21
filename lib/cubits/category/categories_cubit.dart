import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/models/category/category_model.dart';
import 'package:flutter_exam_five/data/repository/categories_repository.dart';
import 'package:formz/formz.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(const CategoriesState(categories: []));

  final CategoriesRepository _categoriesRepository;

  void getCategories() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final categories = await _categoriesRepository.getCategories();
      emit(state.copyWith(
        categories: categories,
        status: FormzStatus.submissionSuccess,
      ));
    } on DioError catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorText: error.toString(),
        ),
      );
    }
  }
}
