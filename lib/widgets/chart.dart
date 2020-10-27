import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _userTransactions;

  Chart(this._userTransactions);

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
    print(this._weekTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: _weekTransactions.map((weekDayTransaction){
          return Text("Day ${weekDayTransaction['weekDay']}: ${weekDayTransaction['amount']}");
        }).toList(),
      ),
    );
  }
}
