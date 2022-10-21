part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState({
    required this.categories,
    required this.status,
    required this.errorText,
  });

  final List<CategoryModel> categories;
  final FormzStatus status;
  final String errorText;

  CategoryState copyWith({
    List<CategoryModel>? categories,
    FormzStatus? status,
    String? errorText,
  }) =>
      CategoryState(
        categories: categories ?? this.categories,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [categories, status, errorText];
}
