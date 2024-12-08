// lib/models/moneybox.dart
class Moneybox {
  final String name;
  final double targetAmount;
  final double currentBalance;
  final bool isAchieved;

  Moneybox({
    required this.name,
    required this.targetAmount,
    required this.currentBalance,
    this.isAchieved = false,
  });
}
