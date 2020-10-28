import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/shared/date_text_formatter.dart';

class NewTransaction extends StatefulWidget {
  final Function _onAddTransaction;

  // We can pass TextControllers to TextFields and Flutter will register the
  // Value on them, so we don't need to manually create functions to do so.

  NewTransaction(this._onAddTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _itemController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _transactionDate = DateTime.now();

  void _submitTransaction() {
    final item = this._itemController.text;
    final transactionDate = this._transactionDate;
    final amount = _amountController.text.isEmpty
        ? 0
        : double.parse(this._amountController.text);

    if (item.isEmpty || amount <= 0) {
      return;
    }

    this.widget._onAddTransaction(_itemController.text,
        double.parse(_amountController.text), transactionDate);

    // Pop the latest Widget inserted into the screen
    Navigator.of(context).pop();
  }

  void _openTransactionDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 7)),
            lastDate: DateTime.now())
        .then((selectedDate) {
      this._transactionDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Using SingleChildScrollView for when keyboard is enabled, it will "squeeze"
    // the content and make it scrollable
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            // Adjusting bottom based on insets, useful for when keyboard is enabled
            bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Item'),
                controller: this._itemController,
                onSubmitted: (_) {
                  this._submitTransaction();
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: this._amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) {
                  this._submitTransaction();
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(this._transactionDate),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () {
                        _openTransactionDatePicker();
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: this._submitTransaction,
                color: Theme.of(context).accentColor,
                textColor: Theme.of(context).textTheme.button.color,
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
 * This widget needed to be converted to StatefulWidget. Flutter decides in
 * certain moments to re-evaluate its Widgets, and when a Widget gets evaluated,
 * if this is a StatefulWidget, its state is stored in a separated object, so
 * it doesn't get lost.
 */
