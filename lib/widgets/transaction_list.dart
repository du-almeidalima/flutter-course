import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meu_dinheirinho/model/transaction.dart';

import 'transaction_list_item.dart';

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
        : ListView(
            children: this
                ._userTransactions
                .map((transaction) => TransactionListItem(
                    key: ValueKey(transaction.id),
                    transaction: transaction,
                    deleteTransaction: _deleteTransaction))
                .toList(),
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
 *
 * The key is necessary when there is multiple StatefulWidgets in the same level
 * and they can be dynamically arranged. Because when an item in the Element Tree
 * is exclude, its state persists, so Flutter checks if the upcoming element is
 * of the same Type and has the same Key, but if it doesn't have a Key, Flutter
 * will only check or its type.
 *
 * Some types of key are:
 * - UniqueKey: Will generate a unique every time it's called, not great for
 * this type of lists, where wee need the key to match, even after another build
 * - ValueKey: Generates a key with a constant value
 */
