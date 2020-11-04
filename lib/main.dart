import 'package:flutter/material.dart';
import 'package:meu_rango/mock/meals_data.dart';
import 'package:meu_rango/models/meal.dart';
import 'package:meu_rango/pages/category_meals_page.dart';
import 'package:meu_rango/pages/filters_page.dart';
import 'package:meu_rango/pages/meal_details_page.dart';
import 'package:meu_rango/pages/tabs_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      this._filters = filterData;
      this._availableMeals = DUMMY_MEALS.where((m) {
        if (this._filters['gluten'] && !m.isGlutenFree) {
          return false;
        }
        if (this._filters['lactose'] && !m.isLactoseFree) {
          return false;
        }
        if (this._filters['vegetarian'] && !m.isVegetarian) {
          return false;
        }
        if (this._filters['vegan'] && !m.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(String mealId) {
    final mealIndex = this._favoriteMeals.indexWhere((m) => m.id == mealId);
    if (mealIndex < 0) {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((m) => m.id == mealId));
      });
    } else {
      setState(() {
        _favoriteMeals.removeWhere((m) => m.id == mealId);
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return this._favoriteMeals.any((m) => m.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Rango',
      theme: ThemeData(
        accentColor: Color.fromRGBO(255, 150, 154, 1),
        primarySwatch: Colors.teal,
        canvasColor: Color.fromRGBO(235, 255, 235, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(
                color: const Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: const TextStyle(
                color: const Color.fromRGBO(20, 51, 51, 1),
              ),
              headline4:
                  const TextStyle(fontFamily: 'RobotoCondensed', fontSize: 28),
              headline6: const TextStyle(
                color: Colors.black87,
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // Home is already registered as "/" route
      home: TabsPage(
        favoriteMeals: this._favoriteMeals,
      ),
      // Already the default
      initialRoute: "/",
      // In here we can register path to load pages on top of the Navigator Stack
      routes: {
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(
              this._availableMeals,
            ),
        MealDetailsPage.routeName: (ctx) => MealDetailsPage(
              this._toggleFavoriteMeal,
              this._isMealFavorite,
            ),
        FiltersPage.routeName: (ctx) => FiltersPage(
              saveFilters: this._setFilters,
              filters: this._filters,
            ),
      },
      // Is called when a named route is not present in the routes table, above.
      onGenerateRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute(
          builder: (ctx) => CategoryMealsPage(this._availableMeals),
        );
      },
      // This is reached whe the route that is being called doesn't exists on
      // routes Table neither onGenerateRoute, this is the last step before
      // Flutter throws an error
      onUnknownRoute: (settings) {
        print('Unknown route reached');
        return MaterialPageRoute(builder: (ctx) => Text('Unknown Route!'));
      },
    );
  }
}
