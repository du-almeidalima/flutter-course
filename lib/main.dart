import 'package:flutter/material.dart';
import 'package:meu_rango/pages/categories_page.dart';
import 'package:meu_rango/pages/category_meals_page.dart';
import 'package:meu_rango/pages/meal_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: CategoriesPage(),
      // Already the default
      initialRoute: "/",
      // In here we can register path to load pages on top of the Navigator Stack
      routes: {
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealDetailsPage.routeName: (ctx) => MealDetailsPage()
      },
      // Is called when a named route is not present in the routes table, above.
      onGenerateRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute(
          builder: (ctx) => CategoryMealsPage(),
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
