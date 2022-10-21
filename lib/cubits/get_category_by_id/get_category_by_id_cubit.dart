import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/data/model/get_category_by_id/get_category_by_id_model.dart';
import 'package:flutter_exam_five/data/repository/categories_repo.dart';
import 'package:flutter_exam_five/data/service/api_provider.dart';

part 'get_category_by_id_state.dart';

class GetCategoryByIdCubit extends Cubit<GetCategoryByIdState> {
  CategoriesRepository categoriesRepository =
      CategoriesRepository(apiProvider: ApiProvider());
  GetCategoryByIdCubit() : super(GetCategoryByIdInitial());

  Future<void> getCategoryById({required int categoryId}) async {
    emit(GetCategoryByIdInProgress());
    try {
      List<GetCategoryByIdModel> category =
          await categoriesRepository.getCategoryById(categoryId: categoryId);
      emit(GetCategoryByIdInSuccess(category: category));
    } catch (e) {
      emit(GetCategoryByIdInFailure(error: e.toString()));
    }
  }
}
