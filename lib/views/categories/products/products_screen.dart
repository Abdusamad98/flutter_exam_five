import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/products/products_cubit.dart';
import 'package:flutter_exam_five/data/services/notification/local_notification_service.dart';
import 'package:flutter_exam_five/utils/utils.dart';
import 'package:flutter_exam_five/views/categories/products/widgets/product_item_view.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsOnProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductsOnSuccess) {
            return GridView.builder(
              itemCount: state.products.length,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.60,
              ),
              itemBuilder: (context, index) {
                return ProductsItemView(
                  productModel: state.products[index],
                  onTap: () {
                    UtilityFunctions.getMyToast(
                        message: "It will showed in 15 sec");
                    LocalNotificationService.localNotificationService
                        .scheduleNotification(
                      title: "Shop",
                      body:
                          "${categoryName}dagi ${state.products[index].name} muvaffaqiyatili qo'shildi",
                    );
                  },
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  final String categoryName;
}
