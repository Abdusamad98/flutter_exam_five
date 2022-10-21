import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/repository/category/category_repository.dart';
import 'package:flutter_exam_five/modeles/category_item.dart';
import 'package:flutter_exam_five/modeles/my_state.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({
    required this.categoryRepo,
  }) : super(
    const CategoryState(
      categories: [],
      myState: MyState.PURE,
      errorText: "",
    ),
  ) {
    getAllCategories();
  }

  final CategoryRepo categoryRepo;

  Future<void> getAllCategories() async {
    emit(state.copyWith(myState: MyState.LOADING));
    try {
      var categories = await categoryRepo.getAllCategories();
      emit(state.copyWith(myState: MyState.SUCCESS, categories: categories));
    } catch (error) {
      print(error);
      emit(state.copyWith(myState: MyState.ERROR, errorText: "GET ALL CATEGORIES ERROR!!!"));
    }
  }
}