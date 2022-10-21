part of 'product_views_cubit.dart';

@immutable
abstract class ProductViewsState {}

class ProductViewsInitial extends ProductViewsState {}

class ProductViewsInProgress extends ProductViewsState {}

class ProductViewsInSuccess extends ProductViewsState {
  ProductViewsInSuccess({required this.views});

  List<ProductModel> views;
}

class ProductViewsInFailure extends ProductViewsState {
  ProductViewsInFailure({required this.errorText});

  String errorText;
}
