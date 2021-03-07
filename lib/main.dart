import 'package:flutter/material.dart';
// import 'package:SnackApp/screens/categories.dart';
import 'package:SnackApp/screens/categories_snacks.dart';
import 'package:SnackApp/screens/filters.dart';
import 'package:SnackApp/database/snacks.dart';
import 'package:SnackApp/models/snack.dart';
import 'package:SnackApp/screens/snack_detail.dart';
import 'package:SnackApp/screens/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Snack> _availableSnacks = snackItems;
  List<Snack> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableSnacks = snackItems.where((snack) {
        if (_filters['gluten'] == true && !snack.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !snack.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] == true && !snack.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] == true && !snack.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String snackId) {
    final existingIndex =
        _favoriteMeals.indexWhere((snack) => snack.id == snackId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(snackItems.firstWhere((snack) => snack.id == snackId));
      });
    }
  }

  bool _isSnackFavourite(String id) {
    return _favoriteMeals.any((snack) => snack.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: MyHomePage(),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        // '/': (ctx) => CategoriesScreen(),
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoriesSnacksScreen.routeName: (ctx) =>
            CategoriesSnacksScreen(_availableSnacks),
        SnackDetailScreen.routeName: (ctx) =>
            SnackDetailScreen(_toggleFavorite, _isSnackFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
      // onUnknownRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SnackApp'),
//       ),
//       body: Center(
//         child: Text('Happy Snacking!'),
//       ),
//     );
//   }
// }
