// lib/models/deposit.dart
class Deposit {
  final double amount;
  final DateTime date;
  final double rate;
  final int periodMonths;
  final double currentEarnings;
  final bool autoExtend;

  Deposit({
    required this.amount,
    required this.date,
    required this.rate,
    required this.periodMonths,
    required this.currentEarnings,
    this.autoExtend = false,
  });
}
