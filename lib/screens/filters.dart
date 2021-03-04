import 'package:flutter/material.dart';
import 'package:SnackApp/models/drawer.dart';

class FiltersScreen extends StatelessWidget {
  static String routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          'Snack Filter',
        ),
      ),
    );
  }
}
