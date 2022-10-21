part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState({
    required this.categories,
    required this.myState,
    required this.errorText,
  });

  final List<CategoryItem> categories;
  final MyState myState;
  final String errorText;

  CategoryState copyWith({
    List<CategoryItem>? categories,
    MyState? myState,
    String? errorText,
  }) =>
      CategoryState(
        categories: categories ?? this.categories,
        myState: myState ?? this.myState,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [categories, myState, errorText];
}