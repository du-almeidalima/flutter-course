import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text("heeeey!"),
      ),
    );
  }
}
