// lib/viewmodels/deposit_view_model.dart
import 'package:flutter/foundation.dart';

import '../../models/deposit/deposit.dart';
import '../../models/deposit/moneybox.dart';

class DepositViewModel extends ChangeNotifier {
  List<Deposit> _deposits = [];
  List<Moneybox> _moneyboxes = [];

  List<Deposit> get deposits => _deposits;
  List<Moneybox> get moneyboxes => _moneyboxes;

  void addDeposit(Deposit deposit) {
    _deposits.add(deposit);
    notifyListeners();
  }

  void addMoneybox(Moneybox moneybox) {
    _moneyboxes.add(moneybox);
    notifyListeners();
  }
}
