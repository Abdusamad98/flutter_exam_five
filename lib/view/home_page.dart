import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/shop_cubit.dart';
import 'package:flutter_exam_five/service/shop_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ShopService.getService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        centerTitle: true,
      ),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          if (state is ShopLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ShopSuccess) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(width * .03, height * .02, width * .03, 0),
                    height: height * .14,
                    decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [
                      Expanded(
                          child: Image.network(
                        state.data[index].imageUrl,
                        fit: BoxFit.cover,
                      )),
                      Expanded(
                          child: Text(
                        textAlign: TextAlign.center,
                        state.data[index].name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))
                    ]),
                  );
                });
          } else if (state is ShopError) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
