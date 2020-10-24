import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
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

  // We can pass TextControllers to TextFields and Flutter will register the
  // Value on them, so we don't need to manually create functions to do so.
  final itemController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Dinheirinho'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // The Text Widget depends on the size of its content and the Card
          // Will fit the size of its child, unless its parent has a defined
          // width
          Card(
            child: Text('CHART'),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Item'),
                    controller: this.itemController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: this.amountController,
                  ),
                  OutlineButton(
                    onPressed: () {},
                    child: Text('Save'),
                    textColor: Colors.blueAccent,
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...this.transactionsList.map((transaction) {
                return Card(
                  child: Row(children: [
                    Container(
                      child: Text(
                        "\$ ${transaction.amount.toStringAsFixed(2)}",
                        softWrap: false,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      width: 100,
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: Colors.lightBlueAccent),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                            color: Colors.lightBlueAccent[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(DateFormat.yMMMMd().format(transaction.date)),
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
