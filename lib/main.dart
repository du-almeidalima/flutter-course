import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meu_dinheirinho/widgets/chart.dart';
import 'package:meu_dinheirinho/widgets/new_transaction.dart';
import 'package:meu_dinheirinho/widgets/transaction_list.dart';

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
  bool _switchStatus = false;

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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
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

    // The Text Widget depends on the size of its content and the Card
    // Will fit the size of its child, unless its parent has a defined
    // width
    final transactionsList = Container(
      height: availableHeight * 0.7,
      child: TransactionList(this._userTransactions, this._deleteTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                      value: this._switchStatus,
                      onChanged: (value) {
                        setState(() {
                          this._switchStatus = value;
                        });
                      }),
                ],
              ),
            // Check if in landscape then show either one or the other, if not,
            // show both
            if (isLandscape)
              this._switchStatus
                  ? Container(
                      height: availableHeight * 0.6,
                      child: Chart(this._userTransactions),
                    )
                  : transactionsList,
            if (!isLandscape)
              Container(
                height: availableHeight * 0.2,
                child: Chart(this._userTransactions),
              ),
            if (!isLandscape) transactionsList
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          this._startAddNewTransaction(context);
        },
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
