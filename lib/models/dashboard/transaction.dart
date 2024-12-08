// lib/models/transaction.dart
class Transaction {
  final String title;
  final String type;
  final double amount;
  final DateTime date;
  final String icon;

  Transaction({
    required this.title,
    required this.type,
    required this.amount,
    required this.date,
    required this.icon,
  });
}