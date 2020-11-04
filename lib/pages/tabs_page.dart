import 'package:flutter/material.dart';
import 'package:meu_rango/models/meal.dart';
import 'package:meu_rango/pages/categories_page.dart';
import 'package:meu_rango/pages/favorites_page.dart';
import 'package:meu_rango/widgets/main_drawer.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  // Receiving it via constructor from Main to pass on to FavoritesPage
  const TabsPage({@required this.favoriteMeals});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    this._pages = [
      {'page': CategoriesPage(), 'title': 'Categorias'},
      {
        'page': FavoritesPage(favoriteMeals: widget.favoriteMeals),
        'title': 'Favoritos'
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      this.selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._pages[this.selectedPageIndex]['title']),
      ),
      body: this._pages[this.selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        currentIndex: this.selectedPageIndex,
        // When use BottomNavigationBarType.shifting it's needed to style the
        // BottomNavigationBarItem manually
        type: BottomNavigationBarType.shifting,
        onTap: this._selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: "Categoria",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: "Favoritos",
          )
        ],
      ),
    );
  }
}

/*
 * BottomNavigationBar allow us to create a TabBar on the bottom, but it works
 * a little different of TabBar, here we need to do things a little more manually
 */
