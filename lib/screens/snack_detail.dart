import 'package:flutter/material.dart';

class SnackDetailScreen extends StatelessWidget {
  static const routeName = '/snack-detail';

  @override
  Widget build(BuildContext context) {
    // final snackId = ModalRoute.of(context).settings.arguments;
    return Center(
      child: Text(
        'Happy Snacking!',
      ),
    );
  }
}
