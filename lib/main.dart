import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:meu_dinheirinho/widgets/body.dart';
import 'package:meu_dinheirinho/widgets/new_transaction.dart';

import 'model/transaction.dart';

void main() => runApp(DinheirinhoApp());

// == MAIN ==
class DinheirinhoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Dinheirinho',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.green[900],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
            )),
        // Copying the AppTheme and only customizing the FontFamily for appBar Children
        appBarTheme: AppBarTheme(
          // ThemeData.light() copies the theme configuration
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    );
  }
}

// == HOME PAGE ==
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'Shoes', date: DateTime.now(), amount: 99.99),
    Transaction(
        id: 't2', title: 'WaterCooler', date: DateTime.now(), amount: 199.99),
    Transaction(
        id: 't3', title: 'Kit Cooler', date: DateTime.now(), amount: 350.00)
  ];

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return NewTransaction(this._addTransaction);
        });
  }

  void _addTransaction(String title, double amount, DateTime transactionDate) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: transactionDate);

    setState(() {
      this._userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      this._userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Meu Dinheirinho',
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            this._startAddNewTransaction(context);
          },
        ),
      ],
    );

    final double availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: Body(
        availableHeight: availableHeight,
        data: BodyData(
          userTransactions: this._userTransactions,
          deleteTransaction: this._deleteTransaction
        ),
      ),
      floatingActionButton: Platform.isAndroid
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                this._startAddNewTransaction(context);
              },
            )
          : null,
    );
  }
}
