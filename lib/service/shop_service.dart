import 'package:dio/dio.dart';
import 'package:flutter_exam_five/model/shop_info_model.dart';
import 'package:flutter_exam_five/model/shop_model.dart';

class ShopService {
  static Future<List<Shop>> getService() async {
    Response res = await Dio().get('https://third-exam.free.mockoapp.net/categories');
    return (res.data as List).map((e) => Shop.fromJson(e)).toList();
  }

  static getInfoService(int index)async{
    Response res = await Dio().get('https://third-exam.free.mockoapp.net/categories/1');
    return (res.data as List).map((e) => ShopInfo.fromJson(e)).toList();
  }
}