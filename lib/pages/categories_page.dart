import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      // SliverGridDelegateWithMaxCrossAxisExtent configures how the Grid should
      // structure itself.
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        // For a 200 pixel wide an Item will have 300 pixel height
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      children: [],
    );
  }
}
