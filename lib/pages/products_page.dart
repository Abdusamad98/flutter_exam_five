import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter_exam_five/cubits/products_cubit/products_cubit.dart';
import 'package:flutter_exam_five/data/services/local_notification_service.dart';
import 'package:formz/formz.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key, required this.catName, required this.catId})
      : super(key: key);
  final String catName;
  final int catId;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getProducts(id: widget.catId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catName),
        centerTitle: true,
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
        if (state is ProductsInProgressState) {
          debugPrint('Status inProgress');
        } else if (state is ProductsInSuccessState) {
          debugPrint('Status success');
        } else if (state is ProductsInFailureState) {
          debugPrint('Status failure');
        }
      }, builder: (context, state) {
        if (state is ProductsInProgressState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsInSuccessState) {
          var products = state.products;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              children: List.generate(products.length, (index) {
                var item = products[index];
                return Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      SizedBox(
                        width: double.infinity,
                        height: 90,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item.productImageUrl,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Text(
                        item.productName,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(item.description),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${item.productPrice.toString()} \$",
                          style: const TextStyle(color: Colors.green),
                        ),
                      )
                    ]),
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: const Icon(Icons.favorite),
                        onPressed: () {
                          LocalNotificationService.localNotificationService
                              .scheduleNotification(item.productName);
                        },
                      ))
                ]);
              }),
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
