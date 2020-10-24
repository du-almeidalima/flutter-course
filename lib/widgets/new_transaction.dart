import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function _onAddTransaction;
  // We can pass TextControllers to TextFields and Flutter will register the
  // Value on them, so we don't need to manually create functions to do so.
  final _itemController = TextEditingController();
  final _amountController = TextEditingController();

  NewTransaction(this._onAddTransaction);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: this._amountController,
            ),
            OutlineButton(
              onPressed: () {
                this._onAddTransaction(
                  _itemController.text,
                  double.parse(_amountController.text)
                );
              },
              child: Text('Save'),
              textColor: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
