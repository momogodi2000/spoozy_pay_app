// lib/models/wallet_balance.dart
class WalletBalance {
  final String type;
  final double amount;
  final String currency;

  WalletBalance({
    required this.type,
    required this.amount,
    required this.currency,
  });
}