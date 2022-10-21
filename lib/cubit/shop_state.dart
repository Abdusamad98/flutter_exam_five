part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {
  ShopLoading();
}

class ShopSuccess extends ShopState {
  List<Shop> data;
  ShopSuccess({required this.data});
}

class ShopError extends ShopState {
  String errMessage;
  ShopError({required this.errMessage});
}
