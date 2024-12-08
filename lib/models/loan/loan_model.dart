// lib/models/loan.dart
class Loan {
  final double amount;
  final String currency;
  final double rate;
  final int period;
  final DateTime startDate;
  final double monthlyPayment;
  final double totalPaid;
  final double amountLeft;
  final String status;

  Loan({
    required this.amount,
    required this.currency,
    required this.rate,
    required this.period,
    required this.startDate,
    required this.monthlyPayment,
    required this.totalPaid,
    required this.amountLeft,
    required this.status,
  });
}
