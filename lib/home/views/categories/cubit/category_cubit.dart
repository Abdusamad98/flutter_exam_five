
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/apiBase.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryInitialState());

  List<dynamic> postData = [];

  Future getData() async {
    try {
      Response res = await Dio().get(ApiBase.instance.caregories);

      if (res.statusCode == 200) {
        postData = res.data;

        emit(CategoryCompletedState(data: postData));
      } else {
        emit(const CategoryErrorState());
      }
    } catch (e) {
      emit(const CategoryErrorState());
      
    }
  }
}
