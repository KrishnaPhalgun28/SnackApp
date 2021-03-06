import 'package:flutter/material.dart';
// import 'package:SnackApp/database/snacks.dart';
import 'package:SnackApp/models/snack_item.dart';
import 'package:SnackApp/models/snack.dart';

class CategoriesSnacksScreen extends StatefulWidget {
  static const routeName = '/categories-snacks';
  final List<Snack> availableSnacks;

  CategoriesSnacksScreen(this.availableSnacks);

  @override
  _CategoriesSnacksScreenState createState() => _CategoriesSnacksScreenState();
}

class _CategoriesSnacksScreenState extends State<CategoriesSnacksScreen> {
  String categoryTitle;
  List<Snack> displayedSnacks;
  var _loadedInitData = false;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedSnacks = widget.availableSnacks.where((snack) {
        return snack.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeSnack(String snackId) {
    setState(() {
      displayedSnacks.removeWhere((snack) => snack.id == snackId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            // return Text(displayedSnacks[index].title);
            return SnackItem(
              id: displayedSnacks[index].id,
              title: displayedSnacks[index].title,
              imageUrl: displayedSnacks[index].imageUrl,
              duration: displayedSnacks[index].duration,
              complexity: displayedSnacks[index].complexity,
              affordability: displayedSnacks[index].affordability,
              removeItem: _removeSnack,
            );
          },
          itemCount: displayedSnacks.length,
        ),
      ),
    );
  }
}
