import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  final String id;
  final String categoryTitle;

  const CategoryMealsPage({this.id, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.categoryTitle),
      ),
      body: Center(
        child: Text("heeeey!"),
      ),
    );
  }
}
