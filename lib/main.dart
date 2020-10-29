import 'package:flutter/material.dart';
import 'package:meu_rango/pages/categories_page.dart';
import 'package:meu_rango/pages/category_meals_page.dart';

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
        canvasColor: Colors.white,
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
                fontFamily: 'RobotoCondensed',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: CategoriesPage(),
      // In here we can register path to load pages on top of the Navigator Stack
      routes: {
        '/category-meals': (ctx) => CategoryMealsPage(),
      },
    );
  }
}
