part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class GetProductsInProgress extends ProductState {}

class GetProductsInSuccess extends ProductState {
  GetProductsInSuccess({required this.products});

  final List<ProductItem> products;
}

class GetProductsInFailure extends ProductState {
  GetProductsInFailure({required this.errorText});

  final String errorText;
}