part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  const CategoriesState(
      {required this.formzStatus,
      required this.categories,
      required this.errorText});
  final FormzStatus formzStatus;
  final List<CategoryModel> categories;
  final String errorText;

  CategoriesState copyWith({
    FormzStatus? formzStatus,
    List<CategoryModel>? categories,
    String? errorText,
  }) =>
      CategoriesState(
        formzStatus: formzStatus ?? this.formzStatus,
        categories: categories ?? this.categories,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object?> get props => [
        errorText,
        categories,
        formzStatus,
      ];
}
