// lib/models/goal_model.dart
class GoalModel {
  String title;
  double targetAmount;
  double amountPerDay;
  String cardNumber;
  bool isRoundingToOne;
  bool isRoundingToTen;

  GoalModel({
    this.title = '',
    this.targetAmount = 0.0,
    this.amountPerDay = 0.0,
    this.cardNumber = '',
    this.isRoundingToOne = false,
    this.isRoundingToTen = false,
  });
}
