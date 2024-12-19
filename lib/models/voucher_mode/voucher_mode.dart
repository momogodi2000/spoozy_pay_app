
// lib/models/voucher_model.dart
class VoucherModel {
  final String id;
  final double amount;
  final String code;
  final DateTime expiryDate;
  final String status; // active, used, transferred
  final String ownerId;

  VoucherModel({
    required this.id,
    required this.amount,
    required this.code,
    required this.expiryDate,
    required this.status,
    required this.ownerId,
  });
}