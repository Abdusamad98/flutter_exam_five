import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/model/shop_info_model.dart';
import 'package:flutter_exam_five/service/shop_service.dart';

part 'shop_info_state.dart';

class ShopInfoCubit extends Cubit<ShopInfoState> {
  ShopInfoCubit({required this.shopService, required this.index}) : super(ShopInfoInitial()) {
    getAccessories(index);
    ShopService.getInfoService(index);
  }

  final ShopService shopService;
  final int index;

  Future<void> getAccessories(int index) async {
    try {
      emit(ShopInfoLoading());
      var data = await ShopService.getInfoService(index);
      emit(ShopInfoSuccess(infoData: data));
    } catch (e) {
      emit(ShopInfoError(infoErrMessage: e.toString()));
    }
  }
}
