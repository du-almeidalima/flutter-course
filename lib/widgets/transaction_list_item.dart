import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/model/transaction.dart';
import 'package:meu_dinheirinho/shared/widgets/confirm_dialog.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key key,
    @required this.transaction,
    @required Function deleteTransaction,
  }) : _deleteTransaction = deleteTransaction, super(key: key);

  final Transaction transaction;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(transaction.title),
        subtitle: Text(
            DateFormat.yMMMd('pt_BR').format(transaction.date)),
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
                    this._deleteTransaction(transaction.id));
          },
        ),
      ),
    );
  }
}