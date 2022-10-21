part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  const CategoriesState(
      {required this.status,
      required this.errorText,
      required this.categories});

  final FormzStatus status;
  final List<CategoriesModel> categories;
  final String errorText;

  CategoriesState copyWith({
    FormzStatus? status,
    List<CategoriesModel>? categories,
    String? errorText,
  }) =>
      CategoriesState(
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
        categories: categories ?? this.categories,
      );

  @override
  List<Object?> get props => [
        status,
        categories,
        errorText,
      ];
}