import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _onAddTransaction;

  // We can pass TextControllers to TextFields and Flutter will register the
  // Value on them, so we don't need to manually create functions to do so.
  final _itemController = TextEditingController();
  final _amountController = TextEditingController();

  NewTransaction(this._onAddTransaction);

  void _submitTransaction() {
    final item = this._itemController.text;
    final amount = _amountController.text.isEmpty
        ? 0
        : double.parse(this._amountController.text);

    if (item.isEmpty || amount <= 0) {
      return;
    }

    this._onAddTransaction(
        _itemController.text, double.parse(_amountController.text));
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
