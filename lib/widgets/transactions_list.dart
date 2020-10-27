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
      child: ListView.builder(
        itemCount: _userTransactions.length,
        itemExtent: 75,
        itemBuilder: (BuildContext context, int index) {
          final transaction = this._userTransactions[index];
          return Card(
            child: Row(children: [
              Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                ),
                child: Text(
                  "\$ ${transaction.amount.toStringAsFixed(2)}",
                  softWrap: false,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    transaction.title,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontFamily:
                          Theme.of(context).textTheme.headline6.fontFamily,
                      fontSize: Theme.of(context).textTheme.headline6.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline6.fontWeight,
                    ),
                  ),
                  Text(DateFormat.yMMMMd().format(transaction.date)),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}

/*
 * In Flutter if we want to make some Widget scrollable, we need to first,
 * define a height on it, and then we can wrap it SingleChildScrollView.
 *
 * In here, we could use the ListView, which is basically a Column with a
 * SingleChildScrollView, but ListView is recommended for short lists with
 * a fixed length.
 *
 * Another alternative, is to use the ListView.build() which is a ListView
 * that only renders the items that are being currently shown onto the screen.
 * But for using this Widget, we need to provide a itemBuilder function as a
 * named argument, that will build the List items based on the index of the
 * currently being loaded.
 */
