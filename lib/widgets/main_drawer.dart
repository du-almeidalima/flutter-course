import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meu_rango/pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  ListTile buildListTile(IconData icon, String title, Function onTileTapped) =>
      ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTileTapped,
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              "Meu Rango",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).accentColor),
            ),
          ),
          this.buildListTile(Icons.restaurant, "Receitas", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          this.buildListTile(Icons.settings, "Filtros", () {
            Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
          }),
        ],
      ),
    );
  }
}
