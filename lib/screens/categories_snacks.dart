import 'package:flutter/material.dart';
import 'package:SnackApp/database/snacks.dart';

class CategoriesSnacksScreen extends StatelessWidget {
  static const routeName = '/categories-snacks';
  // final String categoryId;
  // final String categoryTitle;

  // CategoriesSnacksScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categorySnacks = snackItems.where((snack) {
      return snack.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(categorySnacks[index].title);
          },
          itemCount: categorySnacks.length,
        ),
      ),
    );
  }
}
