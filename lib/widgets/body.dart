import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/model/transaction.dart';
import 'package:meu_dinheirinho/widgets/transaction_list.dart';

import 'chart.dart';

class BodyData {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  BodyData({this.userTransactions, this.deleteTransaction});
}

class Body extends StatefulWidget {
  final double availableHeight;
  final BodyData data;

  Body({@required this.availableHeight, @required this.data});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _switchStatus = false;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // The Text Widget depends on the size of its content and the Card
    // Will fit the size of its child, unless its parent has a defined
    // width
    final transactionsList = Container(
      height: widget.availableHeight * 0.7,
      child: TransactionList(
        widget.data.userTransactions,
        widget.data.deleteTransaction,
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
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
                    height: widget.availableHeight * 0.6,
                    child: Chart(widget.data.userTransactions),
                  )
                : transactionsList,
          if (!isLandscape)
            Container(
              height: widget.availableHeight * 0.2,
              child: Chart(widget.data.userTransactions),
            ),
          if (!isLandscape) transactionsList
        ],
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