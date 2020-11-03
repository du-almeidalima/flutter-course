import 'package:flutter/material.dart';
import 'package:meu_rango/widgets/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtros'),
      ),
      body: Text('Filters!!'),
      drawer: MainDrawer(),
    );
  }
}
