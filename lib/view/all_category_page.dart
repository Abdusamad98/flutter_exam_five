import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/all_category_cubit.dart';
import 'package:flutter_exam_five/view/single_category.dart';
import 'package:formz/formz.dart';
class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({Key? key}) : super(key: key);

  @override
  State<AllCategoryPage> createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllCategoryCubit>(context).getAllCategory();
  }
  @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AllCategory"),),
      body: BlocBuilder<AllCategoryCubit, AllCategoryState>(
        builder: (context, state){
          if(state.formzStatus== FormzStatus.submissionInProgress){
            return Center(child: CircularProgressIndicator(),);
          }else if(state.formzStatus== FormzStatus.submissionFailure){
            return Center(child: Text("Error...."),);
          }else{
            return ListView(children: List.generate(state.category.length, (index) => InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SingleCategoryPage(
                      categoryId:state.category[index].id
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  title: Text(state.category[index].name),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.category[index].createdAt),
                      Image.network(state.category[index].imageUrl, width:  100,)
                    ],
                  ),

                ),
              ),
            )),);
          }
        },
      ),
    );
  }
}
