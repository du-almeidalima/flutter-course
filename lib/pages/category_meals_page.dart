import 'package:flutter/material.dart';
import 'package:meu_rango/mock/meals_data.dart';
import 'package:meu_rango/widgets/meal_item.dart';

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
          final item = categoryMeals[index];
          return MealItem(
              title: item.title,
              affordability: item.affordability,
              imgUrl: item.imageUrl,
              complexity: item.complexity,
              duration: item.duration);
        },
      ),
    );
  }
}
