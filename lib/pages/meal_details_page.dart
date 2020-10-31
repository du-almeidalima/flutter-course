import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes da Refeição'),
        ),
        body: Text(mealId));
  }
}
