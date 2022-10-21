import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_state.dart';
import 'categories/view/category_view.dart';
import 'favourite/view/favourite_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        builder: (contextcubit, state) {
          if (state is CategoryState) {
            return CategoryView();
          } else if (state is FavouriteState) {
            return const FavouriteView();
          } else {
            return const Center(
              child: Text("Profile Page"),
            );
          }
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: CupertinoColors.systemGreen,
        ),
        child: NavigationBar(
          backgroundColor: CupertinoColors.quaternarySystemFill,
          elevation: 0,
          animationDuration: const Duration(seconds: 0),
          selectedIndex: context.watch<MainCubit>().currentPage,
          onDestinationSelected: (v) {
            context.read<MainCubit>().changeState(v);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.category),
              label: "Category",
              selectedIcon: Icon(Icons.newspaper),
            ),
         
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              label: "Favourite",
              selectedIcon: Icon(Icons.favorite_outline),
            ),
        
          ],
        ),
      ),
    );
  }
}
