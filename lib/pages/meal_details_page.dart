import 'package:flutter/material.dart';
import 'package:meu_rango/mock/meals_data.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),
    );
  }

  Widget buildIngredientItem(String text) => Text("• $text",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ));

  Widget buildListContainer({Widget child, BuildContext context}) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black38,
              width: 1,
            )),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final meal = DUMMY_MEALS.firstWhere((m) => m.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: buildSectionTitle(context, "Ingredientes"),
              ),
            ),
            Flexible(
                flex: 3,
                child: buildListContainer(
                  context: context,
                  child: ListView.builder(
                    itemCount: meal.ingredientsList.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: buildIngredientItem(meal.ingredientsList[index]),
                      );
                    },
                  ),
                )),
            Flexible(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: buildSectionTitle(context, "Passo a Passo")),
            ),
            Flexible(
                flex: 4,
                child: buildListContainer(
                  context: context,
                  child: ListView.builder(
                    itemCount: meal.stepsList.length,
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            child: Text(
                              '# ${(index + 1)}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(meal.stepsList[index]),
                        ),
                        Divider()
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          // We can pass data to pop method and subscribe to it in the function
          // that called the popped page
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
