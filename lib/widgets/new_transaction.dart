import 'package:flutter/material.dart';

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

  void _submitTransaction() {
    final item = this._itemController.text;
    final amount = _amountController.text.isEmpty
        ? 0
        : double.parse(this._amountController.text);

    if (item.isEmpty || amount <= 0) {
      return;
    }

    this.widget._onAddTransaction(
        _itemController.text, double.parse(_amountController.text));

    // Pop the latest Widget inserted into the screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
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
            OutlineButton(
              onPressed: this._submitTransaction,
              child: Text('Save'),
              textColor: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}

/*
 * This widget needed to be converted to StatefulWidget. Flutter decides in
 * certain moments to re-evaluate its Widgets, and when a Widget gets evaluated,
 * if this is a StatefulWidget, its state is stored in a separated object, so
 * it doens't get lost.
 */