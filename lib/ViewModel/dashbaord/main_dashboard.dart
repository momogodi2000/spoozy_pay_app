import 'package:flutter/foundation.dart';

import '../../models/transaction/transaction.dart';

class maindashboard with ChangeNotifier {
  bool _isMenuOpen = false;

  List<Transaction_main> _recentTransactions = [
    Transaction_main(
      title: 'Orange Money',
      type: 'Money Transfer',
      balance: 20000,
      icon: 'assets/icons/orange_money.png',
    ),
    Transaction_main(
      title: 'MTN Mobile Money',
      type: 'Online payments',
      balance: 15000,
      icon: 'assets/icons/mtn_money.png',
    ),
    Transaction_main(
      title: 'Paidpal',
      type: 'Online payments',
      balance: 15000,
      icon: 'assets/icons/mtn_money.png',
    ),
    Transaction_main(
      title: 'EUMobile money',
      type: 'Online payments',
      balance: 15000,
      icon: 'assets/icons/mtn_money.png',
    ),
  ];

  bool get isMenuOpen => _isMenuOpen;
  List<Transaction_main> get transactions => _recentTransactions;

  void toggleMenu() {
    _isMenuOpen = !_isMenuOpen;
    notifyListeners();
  }

  void addTransaction(Transaction_main transaction) {
    _recentTransactions.insert(0, transaction);
    notifyListeners();
  }
}
