import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/single_category_cubit.dart';
class SingleCategoryPage extends StatefulWidget {
  const SingleCategoryPage({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;


  @override
  State<SingleCategoryPage> createState() => _SingleCategoryPageState();
}

class _SingleCategoryPageState extends State<SingleCategoryPage> {
  @override
  void initState() {
    BlocProvider.of<SingleCategoryCubit>(context)
        .listenCat(id: widget.categoryId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SingleCategory"),
      ),
      body: BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
        builder: (context, state){
          if(state is GetProgress){
            return Center(child: CircularProgressIndicator(),);

          }else if (state is GetFailure){
            return Center(child: Text("Error"),);
          }else if(state is GetInSuccess){
            var single= state.singleCat;
            return ListView(
              children: List.generate(single.length, (index) => Container(
                child: ListTile(title: Text(single[index].name),
                subtitle: Text(single[index].description),
                ),
              )),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}



