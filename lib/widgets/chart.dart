import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/model/transaction.dart';
import 'package:meu_dinheirinho/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _userTransactions;

  Chart(this._userTransactions);

  double get _totalSpending {
    return this
        ._weekTransactions
        .fold(0.0, (acc, curr) => acc + curr['amount']);
  }

  List<Transaction> get _recentTransactions {
    final oneWeekFromNow = DateTime.now().subtract(Duration(days: 7));

    return this._userTransactions.where((transaction) {
      return transaction.date.isAfter(oneWeekFromNow);
    }).toList();
  }

  List<Map<String, Object>> get _weekTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      final double weekDayAmount =
          this._recentTransactions.fold(0.0, (acc, curr) {
        final tDate = curr.date;
        if (tDate.day == weekDay.day &&
            tDate.month == weekDay.month &&
            tDate.year == weekDay.year) {
          return acc + curr.amount;
        }

        return 0;
      });

      return {
        'weekDay': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': weekDayAmount
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(this._totalSpending);
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _weekTransactions.map((wdTransaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  wdTransaction['weekDay'],
                  wdTransaction['amount'],
                  this._totalSpending == 0.0
                      ? 0.0
                      : (wdTransaction['amount'] as double) / this._totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
