import 'package:flutter/material.dart';
import 'package:flutter_exam_five/cubits/categry_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/data/models/product_item.dart';
import 'package:flutter_exam_five/views/products.dart';
import 'package:formz/formz.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("Categorys"),),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state){
          if(state.status == FormzStatus.submissionInProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state.status == FormzStatus.submissionSuccess){
            List<ProductItem> category = state.category;
            return ListView(
              children: List.generate(category.length, (index) =>

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Products(id: category[index].id,),));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(children: [
                        Image.network(category[index].imageUrl,scale: 6,),
                        Column(children: [
                          Text("id: ${category[index].id.toString()}"),
                          Text("name: ${category[index].name}"),
                          Text(category[index].createdAt),
                        ],)
                      ],
                      ),
                    ),
                  )
            )

          );
          }else if(state.status == FormzStatus.submissionFailure){
            return  Center(child: Text(state.errorText.toString()));
          }return const Text("Qandaydur xatooo");
        }


      ) ,
    );
  }
}
