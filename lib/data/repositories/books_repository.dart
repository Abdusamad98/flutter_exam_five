import 'package:flutter_exam_five/data/models/category.dart';
import 'package:flutter_exam_five/data/models/single.dart';

import '../services/api_provider.dart';

class Repository{
  Repository({required this.apiProvider});
  final ApiProvider apiProvider;

Future<List<CategoryItem>> getAllCategory()=>apiProvider.getAllCategory();

Future <List<SingleCat>> getCategoryId({required int id})=>
    apiProvider.getCategoryId(id: id);


}