import 'package:SnackApp/models/snack.dart';
import 'package:flutter/material.dart';
import 'package:SnackApp/models/snack_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Snack> favouriteSnacks;

  FavouritesScreen(this.favouriteSnacks);

  @override
  Widget build(BuildContext context) {
    if (favouriteSnacks.isEmpty) {
      return Center(
        child: Text('no favourites yet... start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          // return Text(favouriteSnacks[index].title);
          return SnackItem(
            id: favouriteSnacks[index].id,
            title: favouriteSnacks[index].title,
            imageUrl: favouriteSnacks[index].imageUrl,
            duration: favouriteSnacks[index].duration,
            complexity: favouriteSnacks[index].complexity,
            affordability: favouriteSnacks[index].affordability,
            // removeItem: _removeSnack,
          );
        },
        itemCount: favouriteSnacks.length,
      );
    }
  }
}
