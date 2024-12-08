class Transaction_page {
  final String type; // Deposit, Withdraw, Transfer
  final String paymentMethod; // MoMo, OM, Bank
  final double amount;
  final DateTime date;
  final String status; // Success, Pending, Failed

  Transaction_page({
    required this.type,
    required this.paymentMethod,
    required this.amount,
    required this.date,
    required this.status,
  });
}
