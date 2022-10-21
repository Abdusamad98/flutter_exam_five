part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    required this.categories,
    this.errorText = '',
    this.status = FormzStatus.pure,
  });
  final List<CategoryModel> categories;
  final String errorText;
  final FormzStatus status;

  CategoriesState copyWith({
    List<CategoryModel>? categories,
    String? errorText,
    FormzStatus? status,
  }) =>
      CategoriesState(
        categories: categories ?? this.categories,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [categories, status, errorText];
}
