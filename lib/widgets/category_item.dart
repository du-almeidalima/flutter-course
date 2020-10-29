import 'package:flutter/material.dart';
import 'package:meu_rango/pages/category_meals_page.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({this.id, this.title, this.color});

  void _onCategoryTapped(BuildContext context) {
    // Since we're not creating the Widget on the fly, but letting Flutter
    // resolve the route for us, Flutter will inject the arguments
    // into the ModalRoute object
    Navigator.of(context).pushNamed(
      '/category-meals',
      arguments: {'id': this.id, 'title': this.title},
    );

    // This will push this page on top of the NavigatorStack as an anonymous page
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (builderContext) => CategoryMealsPage(
    //     id: this.id,
    //     categoryTitle: this.title,
    //   ),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        this._onCategoryTapped(context);
      },
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [this.color.withOpacity(0.5), this.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
