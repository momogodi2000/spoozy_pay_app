// lib/viewmodels/goal_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../../models/deposit/goal_model.dart';

class GoalViewModel extends ChangeNotifier {
  GoalModel _goal = GoalModel();

  GoalModel get goal => _goal;

  void updateTitle(String title) {
    _goal.title = title;
    notifyListeners();
  }

  void updateTargetAmount(double amount) {
    _goal.targetAmount = amount;
    notifyListeners();
  }

  void updateAmountPerDay(double amount) {
    _goal.amountPerDay = amount;
    notifyListeners();
  }

  void updateCardNumber(String number) {
    _goal.cardNumber = number;
    notifyListeners();
  }

  void toggleRoundingToOne() {
    _goal.isRoundingToOne = !_goal.isRoundingToOne;
    if (_goal.isRoundingToOne) _goal.isRoundingToTen = false;
    notifyListeners();
  }

  void toggleRoundingToTen() {
    _goal.isRoundingToTen = !_goal.isRoundingToTen;
    if (_goal.isRoundingToTen) _goal.isRoundingToOne = false;
    notifyListeners();
  }
}