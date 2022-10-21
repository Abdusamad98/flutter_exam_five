import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/product_views_cubit.dart';
import 'package:flutter_exam_five/data/models/products/product_model.dart';


class Products extends StatefulWidget {
   Products({Key? key, required this.id}) : super(key: key);

  int id;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    context.read<ProductViewsCubit>().fetchData(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductViewsCubit, ProductViewsState>(
          builder: (context, state){
            if(state is ProductViewsInProgress){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is ProductViewsInSuccess){
              List<ProductModel> product = state.views;
              return ListView(
                  children: List.generate(product.length, (index) =>

                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(children: [
                            Image.network(product[index].imageUrl,scale: 6,),
                            Column(children: [
                              Text("id: ${product[index].id.toString()}"),
                              Text("name: ${product[index].name}"),
                              Text(product[index].description),
                            ],)
                          ],
                          ),
                        ),
                      )
                  )

              );
            }else if(state is ProductViewsInFailure){
              return  Center(child: Text(state.errorText.toString()));
            }return const Text("Qandaydur xatooo");
          }


      ) ,
    );
  }
}
