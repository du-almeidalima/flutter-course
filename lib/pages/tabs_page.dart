import 'package:flutter/material.dart';
import 'package:meu_rango/pages/categories_page.dart';
import 'package:meu_rango/pages/favorites_page.dart';
import 'package:meu_rango/widgets/main_drawer.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesPage(), 'title': 'Categorias'},
    {'page': FavoritesPage(), 'title': 'Favoritos'},
  ];

  int selectedPageIndex = 0;

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
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: this.selectedPageIndex,
        // When use BottomNavigationBarType.shifting it's needed to style the
        // BottomNavigationBarItem manually
        type: BottomNavigationBarType.shifting,
        onTap: this._selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categoria",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
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
