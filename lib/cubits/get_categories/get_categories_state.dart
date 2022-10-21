part of 'get_categories_cubit.dart';

class GetCategoriesState extends Equatable {
  final String error;
  final List<GetCategoriesModel> categories;
  final FormzStatus status;

  const GetCategoriesState({
    required this.categories,
    required this.error,
    required this.status,
  });

  GetCategoriesState copyWith({
    required FormzStatus status,
    String? error,
    List<GetCategoriesModel>? categories,
  }) =>
      GetCategoriesState(
        categories: categories ?? this.categories,
        error: error ?? this.error,
        status: status,
      );
  @override
  List<Object?> get props => [
        categories,
        status,
        error,
      ];
}
