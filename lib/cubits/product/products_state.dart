part of 'products_cubit.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {}

class ProductsOnProgress extends ProductsState {}

class ProductsOnFailure extends ProductsState {
  ProductsOnFailure({required this.errorText});
  final String errorText;
}

class ProductsOnSuccess extends ProductsState {
  ProductsOnSuccess({required this.products});
  final List<ProductModel> products;
}