// lib/models/loan_model.dart
class LoanModel {
  final String id;
  final double amount;
  final String status;
  final DateTime requestDate;
  final DateTime? dueDate;
  final String borrowerId;
  final String lenderId;

  LoanModel({
    required this.id,
    required this.amount,
    required this.status,
    required this.requestDate,
    this.dueDate,
    required this.borrowerId,
    required this.lenderId,
  });
}
