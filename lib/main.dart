import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/widgets/user_transactions.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // The Text Widget depends on the size of its content and the Card
            // Will fit the size of its child, unless its parent has a defined
            // width
            Card(
              child: Text('CHART'),
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}

/*
 * The Body is wrapped in a SingleChildScrollView, because, whenever the
 * Soft Keyboard is triggered, it adds the input height as bottom padding
 * so it's always visible. However, if the heigh is already full, it throws an
 * error
 */