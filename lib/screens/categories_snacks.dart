import 'package:flutter/material.dart';

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
    // final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'The Recipes For The Category!',
        ),
      ),
    );
  }
}
