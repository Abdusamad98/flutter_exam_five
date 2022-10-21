part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsInProgress extends ProductsState {}

class ProductsInSuccess extends ProductsState {
  ProductsInSuccess({required this.products});

  final List<ProductsModel> products;
}

class ProductsInFailure extends ProductsState{
  ProductsInFailure({required this.errorText});

   String errorText;
}