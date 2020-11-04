import 'package:flutter/material.dart';
import 'package:meu_rango/mock/meals_data.dart';
import 'package:meu_rango/models/meal.dart';
import 'package:meu_rango/widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> categoryMeals;

  const CategoryMealsPage(this.categoryMeals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> categoryMeals;
  bool initialized = false;


  @override
  void didChangeDependencies() {
    /* The ModalRoute.of(context) is not fully initialized in the "initState"
     * Lifecycle, so we can us the didChangeDependencies, however, this method
     * runs for every change on state, so what can be done is set a flag to
     * only run once
     */
    if(!initialized) {
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryMeals = widget.categoryMeals
          .where((meal) => meal.categoriesList.any((id) => categoryId == id))
          .toList();

      this.initialized = true;
    }

    super.didChangeDependencies();
  }

  // _onMealDeleted(String mealId) {
  //   this.setState(() {
  //     this.categoryMeals = categoryMeals.where((m) => m.id != mealId).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: this.categoryMeals.length,
        itemBuilder: (context, index) {
          final item = this.categoryMeals[index];
          return MealItem(
            id: item.id,
            title: item.title,
            affordability: item.affordability,
            imgUrl: item.imageUrl,
            complexity: item.complexity,
            duration: item.duration
          );
        },
      ),
    );
  }
}
