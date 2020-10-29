import 'package:flutter/material.dart';
import 'package:meu_rango/mock/meals_data.dart';

class CategoryMealsPage extends StatelessWidget {
  final String id;
  final String categoryTitle;

  static const routeName = '/category-meals';

  const CategoryMealsPage({this.id, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categoriesList.any((id) => categoryId == id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return Text(categoryMeals[index].title);
        },
      ),
    );
  }
}
