import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const CategoryState());

  int currentPage = 0;

  changeState(int currentIndex) {
    switch (currentIndex) {
      case 0:
        currentPage = 0;
        emit(const CategoryState());
        break;
      case 1:
        currentPage = 1;
        emit(const FavouriteState());
        break;
 
    }
  }
}
