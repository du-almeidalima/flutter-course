import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final double amount;

  const Transaction({
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.amount
  });
}
