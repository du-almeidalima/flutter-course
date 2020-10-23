import 'package:flutter/material.dart';

void main() => runApp(DinheirinhoApp());

class DinheirinhoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Dinheirinho'),
      ),
      body: Column(
        children: <Widget>[
          // The Text Widget depends on the size of its content and the Card
          // Will fit the size of its child, unless its parent has a defined
          // width
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART'),
            ),
          ),
          Card(
            child: Text('LIST OF EXPENSES'),
          )
        ],
      ),
    );
  }
}
