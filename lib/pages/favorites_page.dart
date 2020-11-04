import 'package:flutter/material.dart';
import 'package:meu_rango/models/meal.dart';
import 'package:meu_rango/widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  // Receiving it via constructor from Main to pass on to FavoritesPage
  const FavoritesPage({this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return this.favoriteMeals.isEmpty
        ? Container(
            width: double.infinity,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: Column(
              children: [
                Text(
                  "Você não tem nenhum favorito ainda",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Text(
                  "Começe a adicionar!",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              final mealItem = favoriteMeals[index];
              return MealItem.fromItem(mealItem);
            },
            itemCount: favoriteMeals.length,
          );
  }
}
