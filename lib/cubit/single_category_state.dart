part of 'single_category_cubit.dart';

@immutable
abstract class SingleCategoryState {}

class SingleCategoryInitial extends SingleCategoryState {}
class GetProgress extends SingleCategoryState{}
class GetInSuccess extends SingleCategoryState{

  final List<SingleCat> singleCat;
  GetInSuccess({required this.singleCat});
}
class GetFailure extends SingleCategoryState{
  final String errorText;
  GetFailure({required this.errorText});
}



