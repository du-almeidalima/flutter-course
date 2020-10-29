import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/model/transaction.dart';
import 'package:meu_dinheirinho/shared/widgets/confirm_dialog.dart';

class TransactionListItem extends StatefulWidget {
  const TransactionListItem({
    Key key,
    @required this.transaction,
    @required Function deleteTransaction,
  })  : _deleteTransaction = deleteTransaction,
        super(key: key);

  final Transaction transaction;
  final Function _deleteTransaction;

  @override
  _TransactionListItemState createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem> {
  Color _bgColor;

  @override
  void initState() {
    this._bgColor = [
      Colors.red,
      Colors.pinkAccent,
      Colors.blue,
      Colors.deepPurple,
      Colors.green,
      Colors.yellow,
      Colors.black,
    ][Random().nextInt(7)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: this._bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(widget.transaction.title),
        subtitle:
            Text(DateFormat.yMMMd('pt_BR').format(widget.transaction.date)),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.redAccent,
          ),
          onPressed: () {
            ConfirmDialog.show(
                context: context,
                message: 'Você realmente deseja excluir este item?',
                content: Text(
                  'Essa ação não terá volta.',
                  textAlign: TextAlign.center,
                ),
                confirm: () =>
                    this.widget._deleteTransaction(widget.transaction.id));
          },
        ),
      ),
    );
  }
}
