import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...this._userTransactions.map((transaction) {
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
        ),
      ),
    );
  }
}

/*
 * In Flutter if we want to make some Widget scrollable, we need to first,
 * define a height on it, and then we can wrap it SingleChildScrollView
 */