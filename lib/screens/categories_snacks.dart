import 'package:flutter/material.dart';
import 'package:SnackApp/database/snacks.dart';
import 'package:SnackApp/models/snack_item.dart';

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
            // return Text(categorySnacks[index].title);
            return SnackItem(
              id: categorySnacks[index].id,
              title: categorySnacks[index].title,
              imageUrl: categorySnacks[index].imageUrl,
              duration: categorySnacks[index].duration,
              complexity: categorySnacks[index].complexity,
              affordability: categorySnacks[index].affordability,
            );
          },
          itemCount: categorySnacks.length,
        ),
      ),
    );
  }
}
