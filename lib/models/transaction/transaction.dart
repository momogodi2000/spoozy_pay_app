// lib/models/transaction/transaction.dart
class Transaction_main {
  final String title;
  final String type;
  final double balance;
  final String icon;

  const Transaction_main({
    required this.title,
    required this.type,
    required this.balance,
    required this.icon,
  });

  // Add a copyWith method for easier updates
  Transaction_main copyWith({
    String? title,
    String? type,
    double? balance,
    String? icon,
  }) {
    return Transaction_main(
      title: title ?? this.title,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      icon: icon ?? this.icon,
    );
  }
}