part of 'shop_info_cubit.dart';

@immutable
abstract class ShopInfoState {}

class ShopInfoInitial extends ShopInfoState {}

class ShopInfoLoading extends ShopInfoState {
  ShopInfoLoading();
}

class ShopInfoSuccess extends ShopInfoState {
  List<ShopInfo> infoData;
  ShopInfoSuccess({required this.infoData});
}

class ShopInfoError extends ShopInfoState {
  String infoErrMessage;
  ShopInfoError({required this.infoErrMessage});
}
