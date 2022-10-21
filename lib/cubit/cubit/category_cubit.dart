import 'package:bloc/bloc.dart';
import 'package:flutter_exam_five/cubit/cubit/category_state.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';
import 'package:flutter_exam_five/data/repostory/category_repostory.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({
    required this.categoryRepository,
  }) : super(CategoryInitial()) {
    readSavedNews();
  }

  final CategoryRepository categoryRepository;

  void readSavedNews() async {
    emit(GetCategoryProgress());
    try {
      List<CategoryModel> categories =
          await categoryRepository.getAllCategory();
      emit(GetCategoryInSuccess(categories: categories));
    } catch (error) {
      emit(GetCategoryInFailure(errorText: error.toString()));
    }
  }
}
