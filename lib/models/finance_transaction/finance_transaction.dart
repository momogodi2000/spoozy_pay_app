// lib/models/transaction_model.dart
class TransactionModel {
  final String id;
  final double amount;
  final String type;
  final String status;
  final DateTime date;
  final String paymentMethod;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.type,
    required this.status,
    required this.date,
    required this.paymentMethod,
  });
}