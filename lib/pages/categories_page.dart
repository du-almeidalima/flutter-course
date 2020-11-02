import 'package:flutter/material.dart';
import 'package:meu_rango/mock/categories_data.dart';
import 'package:meu_rango/widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      // SliverGridDelegateWithMaxCrossAxisExtent configures how the Grid should
      // structure itself.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          // For a 200 pixel wide an Item will have 300 pixel height
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((category) =>
          CategoryItem(
            id: category.id,
            title: category.title,
            color: category.color,
          ))
          .toList(),
    );
  }
}
