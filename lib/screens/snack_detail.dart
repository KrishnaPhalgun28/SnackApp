import 'package:flutter/material.dart';
import 'package:SnackApp/database/snacks.dart';

class SnackDetailScreen extends StatelessWidget {
  static const routeName = '/snack-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  SnackDetailScreen(this.toggleFavourite, this.isFavourite);

  @override
  Widget build(BuildContext context) {
    final snackId = ModalRoute.of(context).settings.arguments;
    final selectedSnack = snackItems.firstWhere((snack) => snack.id == snackId);

    Widget buildSectionTitle(BuildContext ctx, String text) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.green,
          ),
        ),
        height: 100,
        width: 330,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedSnack.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 225,
              width: double.infinity,
              child: Image.network(
                selectedSnack.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(
              context,
              'Ingredients',
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedSnack.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedSnack.ingredients.length,
              ),
            ),
            buildSectionTitle(
              context,
              'Steps',
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '# ${index + 1}',
                        ),
                      ),
                      title: Text(
                        selectedSnack.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedSnack.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(snackId) ? Icons.star : Icons.star_border),
        // onPressed: () {
        //   Navigator.of(context).pop(snackId);
        // },
        onPressed: () => toggleFavourite(snackId),
      ),
    );
  }
}
