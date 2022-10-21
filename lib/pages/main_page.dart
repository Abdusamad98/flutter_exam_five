import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_five/cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter_exam_five/pages/products_page.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<CategoriesCubit, CategoriesState>(
            listener: (context, state) {
          switch (state.status) {
            case FormzStatus.submissionInProgress:
              debugPrint('Status inProgress');
              break;
            case FormzStatus.submissionSuccess:
              debugPrint('Status success');
              break;
            case FormzStatus.submissionFailure:
              debugPrint('Status failure');
              break;

            default:
              debugPrint('Another Status');
          }
        }, builder: (context, state) {
          return state.status.isSubmissionInProgress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    var category = state.categories[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ProductsPage(
                                      catName: category.categoryName,
                                      catId: category.categoryId)));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: Colors.grey.shade200,
                        leading: SizedBox(
                            width: 100,
                            height: double.infinity,
                            child: Image.network(
                              category.categoryImageUrl,
                              fit: BoxFit.cover,
                            )),
                        title: Text(category.categoryName),
                        subtitle: Text(DateFormat()
                            .add_yMMMd()
                            .format(DateTime.parse(category.createdAt))),
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
