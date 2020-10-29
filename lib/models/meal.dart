import 'package:flutter/foundation.dart';

enum Complexity {
  EASY,
  CHALLENGING,
  HARD,
}

enum Affordability {
  AFFORDABLE,
  PRICEY,
  LUXURIOUS
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categoriesList;
  final List<String> ingredientsList;
  final List<String> stepsList;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.categoriesList,
      @required this.ingredientsList,
      @required this.stepsList,
      @required this.complexity,
      @required this.affordability,
      @required this.duration,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}