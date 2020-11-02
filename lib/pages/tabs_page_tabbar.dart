import 'package:flutter/material.dart';
import 'package:meu_rango/pages/categories_page.dart';
import 'package:meu_rango/pages/favorites_page.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Widget> tabs = [
    Tab(
      icon: Icon(Icons.category),
      text: "Categoria",
    ),
    Tab(
      icon: Icon(Icons.star),
      text: "Favoritos",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Amount of tabs
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Meu Rango"),
          ),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: [CategoriesPage(), FavoritesPage()],
        ),
      ),
    );
  }
}

/*
 * The DefaultTabController is connected to the TabBar to work together, to
 * detect which tab the user has selected by loading the provided page in the
 * TabBarView.
 *
 * The page will be loaded into the TabBarView, but it's important to notice
 * that it would be a standalone page anymore, it will be inserted into the
 * TabsPage, so it shouldn't have a Scaffold.
 */
