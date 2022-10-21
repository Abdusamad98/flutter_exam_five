import 'package:flutter/widgets.dart';
import 'package:flutter_exam_five/data/models/category_model/category_model.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class GetCategoryProgress extends CategoryState {}

class GetCategoryInSuccess extends CategoryState {
  GetCategoryInSuccess({required this.categories});

  final List<CategoryModel> categories;
}

class GetCategoryInFailure extends CategoryState {
  final String errorText;
  GetCategoryInFailure({required this.errorText});
}
