import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [this.color.withOpacity(0.5), this.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        this.title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
