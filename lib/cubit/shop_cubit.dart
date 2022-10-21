import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/model/shop_model.dart';
import 'package:flutter_exam_five/service/shop_service.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit({required this.shopService}) : super(ShopInitial()) {
    getAccessories();
    ShopService.getService();
  }

  final ShopService shopService;

  Future<void> getAccessories() async {
    try {
      emit(ShopLoading());
      var data = await ShopService.getService();
      emit(ShopSuccess(data: data));
    } catch (e) {
      emit(ShopError(errMessage: e.toString()));
    }
  }
}
