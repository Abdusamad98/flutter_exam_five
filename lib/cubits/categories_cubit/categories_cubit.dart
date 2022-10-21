import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/models/category_model/categories_model.dart';
import 'package:flutter_exam_five/data/repositories/repository.dart';
import 'package:formz/formz.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.myRepository})
      : super(
          const CategoriesState(
            status: FormzStatus.pure,
            errorText: '',
            categories: [],
          ),
        );

  final MyRepository myRepository;

  void fetchCategories() async {
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
      ),
    );
    try {
      var category = await myRepository.getCategories();
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          categories: category,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorText: e.toString(),
        ),
      );
    }
  }
}
