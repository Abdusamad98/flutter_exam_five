import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/models/category/category_item.dart';
import 'package:flutter_exam_five/data/models/my_state.dart';
import 'package:flutter_exam_five/data/repos/category_repo.dart';

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
      emit(state.copyWith(myState: MyState.ERROR, errorText: "GET ALL CATEGORIES ERROR!!!"));
    }
  }
}
