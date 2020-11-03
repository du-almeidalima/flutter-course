import 'package:flutter/material.dart';
import 'package:meu_rango/models/meal.dart';
import 'package:meu_rango/pages/meal_details_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final void Function(String) onItemExcluded;

  String get _translatedComplexity {
    switch (this.complexity) {
      case Complexity.EASY:
        return 'Fácil';
      case Complexity.CHALLENGING:
        return 'Desafiador';
      case Complexity.HARD:
        return 'Difícil';
      default:
        return 'Desconhecido';
    }
  }

  String get _translatedAffordability {
    switch (this.affordability) {
      case Affordability.AFFORDABLE:
        return 'Barato';
      case Affordability.PRICEY:
        return 'Caro';
      case Affordability.LUXURIOUS:
        return 'Luxuoso';
      default:
        return 'Desconhecido';
    }
  }

  const MealItem({
    @required this.title,
    @required this.imgUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.id,
    @required this.onItemExcluded
  });

  void _onMealTapped(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsPage.routeName,
      arguments: this.id,
    ).then((excludedMealId) {
      // Handling the pop of the pushed route
      if (excludedMealId != null) {
        onItemExcluded(excludedMealId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this._onMealTapped(context);
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            // Useful to display items on top of each other
            Stack(
              children: [
                // To shape children Widgets, such as an rounded image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(25),
                    topRight: const Radius.circular(25),
                  ),
                  child: Image.network(
                    this.imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned works in conjunction with Stack and allows to
                // absolute position an item
                Positioned(
                  bottom: 10,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Color.fromRGBO(255, 245, 234, 0.8),
                    child: Text(
                      this.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.end,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outline_rounded),
                      SizedBox(width: 5),
                      Text(this._translatedComplexity)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined),
                      SizedBox(width: 5),
                      Text(this._translatedAffordability)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
