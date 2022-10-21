part of 'products_cubit.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {}

class GetProductsInProgress extends ProductsState {}

class GetProductsInSuccess extends ProductsState {
  GetProductsInSuccess({required this.products});
  List<ProductModel> products;
}

class GetProductsInFailure extends ProductsState {
  GetProductsInFailure({required this.errorText});
  String errorText;
}
