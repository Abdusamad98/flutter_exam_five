part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
   const CategoriesState({
     required this.categories ,
    this.status = FormzStatus.pure,
    this.errorText = "",
  });

  final FormzStatus status;
  final List<CategoryModel> categories;
  final String errorText;

  CategoriesState copyWith({
    FormzStatus? status,
    List<CategoryModel>? categories,
    String? errorText,
  }) =>
      CategoriesState(
        categories: categories ?? this.categories,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [categories, status, errorText];
}
