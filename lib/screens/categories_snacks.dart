import 'package:flutter/material.dart';

class CategoriesSnacksScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoriesSnacksScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
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
