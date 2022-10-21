import 'package:flutter/cupertino.dart';

@immutable
abstract class CategoryState {
  const CategoryState();
}

class CategoryInitialState extends CategoryState {
  const CategoryInitialState();
}

class CategoryCompletedState extends CategoryState {
 final List data;

  CategoryCompletedState({required this.data});
}

class CategoryErrorState extends CategoryState {
  const CategoryErrorState();
}
