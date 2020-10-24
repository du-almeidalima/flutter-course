import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meu_dinheirinho/model/transaction.dart';

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
  final List<Transaction> transactionsList = [
    Transaction(id: 't1', title: 'Shoes', date: DateTime.now(), amount: 99.99),
    Transaction(
        id: 't2', title: 'WaterCooler', date: DateTime.now(), amount: 199.99),
    Transaction(
        id: 't3', title: 'Kit Cooler', date: DateTime.now(), amount: 350.00)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Dinheirinho'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // The Text Widget depends on the size of its content and the Card
          // Will fit the size of its child, unless its parent has a defined
          // width
          Card(
            child: Text('CHART'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...this.transactionsList.map((transaction) {
                return Card(
                  child: Row(children: [
                    Text("\$ ${transaction.amount}"),
                    Column(
                      children: [
                        Text(transaction.title),
                        Text(transaction.date.toString()),
                      ],
                    ),
                  ]),
                );
              }).toList()
            ],
          )
        ],
      ),
    );
  }
}
