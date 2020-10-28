import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/model/transaction.dart';
import 'package:meu_dinheirinho/shared/widgets/confirm_dialog.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'Nenhuma transação até agora',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/no-transaction.png',
                  // BoxFit.cover will infer the height of the Parent into the image
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemCount: _userTransactions.length,
            itemBuilder: (BuildContext context, int index) {
              final transaction = this._userTransactions[index];
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
                    icon: Icon(
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
            },
          );
  }
}

/*
 * In Flutter if we want to make some Widget scrollable, we need to first,
 * define a height on it, and then we can wrap it SingleChildScrollView.
 *
 * In here, we could use the ListView, which is basically a Column with a
 * SingleChildScrollView, but ListView is recommended for short lists with
 * a fixed length.
 *
 * Another alternative, is to use the ListView.build() which is a ListView
 * that only renders the items that are being currently shown onto the screen.
 * But for using this Widget, we need to provide a itemBuilder function as a
 * named argument, that will build the List items based on the index of the
 * currently being loaded.
 */
