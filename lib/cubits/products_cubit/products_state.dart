part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsInProgressState extends ProductsState {}

class ProductsInSuccessState extends ProductsState {
  ProductsInSuccessState({required this.products});

  List<ProductModel> products;
}

class ProductsInFailureState extends ProductsState {
  ProductsInFailureState({required this.errorText});

  final String errorText;
}
