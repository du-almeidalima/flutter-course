import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/model/transaction.dart';
import 'package:meu_dinheirinho/widgets/new_transaction.dart';
import 'package:meu_dinheirinho/widgets/transactions_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Shoes', date: DateTime.now(), amount: 99.99),
    Transaction(
        id: 't2', title: 'WaterCooler', date: DateTime.now(), amount: 199.99),
    Transaction(
        id: 't3', title: 'Kit Cooler', date: DateTime.now(), amount: 350.00)
  ];

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now()
    );

    setState(() {
      this._userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionList(this._userTransactions)
      ],
    );
  }
}

/*.00
 * This is the Widget that will hold the uplifted state from UserTransactions
 * and NewTransaction. This is useful so the Main Widget doesn't get rebuilt
 * after an state change, on this Widget and its children will
 */