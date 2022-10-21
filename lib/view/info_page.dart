import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubit/shop_info_cubit.dart';

class InfoPage extends StatefulWidget {
  InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocListener<ShopInfoCubit, ShopInfoState>(
      listener: (context, state) {
        if (state is ShopInfoLoading) {
          print('Shop Loading State...');
        } else if (state is ShopInfoSuccess) {
          print('Shop Success State...');
        } else if (state is ShopInfoError) {
          print('Shop Error State...');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Info Page'),
          centerTitle: true,
        ),
        body: BlocBuilder<ShopInfoCubit, ShopInfoState>(
          builder: (context, state) {
            if (state is ShopInfoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ShopInfoSuccess) {
              return ListView.builder(
                  itemCount: state.infoData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(width * .03, height * .02, width * .03, 0),
                      height: height * .14,
                      decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
                      child: Stack(children: [
                        Row(children: [
                          Expanded(
                              child: Image.network(
                            state.infoData[index].imageUrl,
                            fit: BoxFit.cover,
                          )),
                          Expanded(
                              child: Text(
                            textAlign: TextAlign.center,
                            state.infoData[index].name,
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                          ))
                        ]),
                        Padding(
                          padding: EdgeInsets.only(left: width*.8),
                          child: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart)),
                        )
                      ]),
                    );
                  });
            } else if (state is ShopInfoError) {
              return Center(
                child: Text(state.infoErrMessage),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
