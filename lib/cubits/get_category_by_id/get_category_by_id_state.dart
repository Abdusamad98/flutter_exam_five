part of 'get_category_by_id_cubit.dart';

@immutable
abstract class GetCategoryByIdState {
  const GetCategoryByIdState();
}

class GetCategoryByIdInitial extends GetCategoryByIdState {}

class GetCategoryByIdInProgress extends GetCategoryByIdState {}

class GetCategoryByIdInSuccess extends GetCategoryByIdState {
  List<GetCategoryByIdModel> category;
  GetCategoryByIdInSuccess({required this.category});
}

class GetCategoryByIdInFailure extends GetCategoryByIdState {
  String error;
  GetCategoryByIdInFailure({required this.error});
}
