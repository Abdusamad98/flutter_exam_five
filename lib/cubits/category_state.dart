part of 'categry_cubit.dart';

 class CategoryState extends Equatable {
  const CategoryState({
    required this.status,
    required this.category,
    required this.errorText,
  });

  final FormzStatus status;
  final List<ProductItem> category;
  final String errorText;


  CategoryState copyWith({
    FormzStatus? status,
    List<ProductItem>? category,
    String? errorText,


  }) =>
      CategoryState(
        status: status ?? this.status,
        category: category ?? this.category,
          errorText:  errorText ?? this.errorText


      );

  @override
  List<Object> get props => [
    status,
    category,
    errorText
  ];
}