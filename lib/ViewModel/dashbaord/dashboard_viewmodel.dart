// lib/viewmodels/dashboard_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../../models/dashboard/account.dart';
import '../../models/dashboard/transaction.dart';

class DashboardViewModel extends ChangeNotifier {
  List<Account> _accounts = [
    Account(type: 'Real Account', balance: 50000, currency: 'XAF'),
    Account(type: 'Blockchain', balance: 5000, currency: 'XAF'),
    Account(type: 'Virtual', balance: 5000, currency: 'XAF'),
  ];

  List<Transaction> _recentTransactions = [
    Transaction(
      title: 'Orange Money',
      type: 'Money transfer',
      amount: 20000,
      date: DateTime.now(),
      icon: 'assets/images/om.jpg',
    ),
    Transaction(
      title: 'MTN Mobile Money',
      type: 'Online payments',
      amount: 15000,
      date: DateTime.now(),
      icon: 'assets/images/mtn.png',
    ),
    // Add more transactions...
  ];

  List<Account> get accounts => _accounts;
  List<Transaction> get recentTransactions => _recentTransactions;

  get Transaction_main => null;

  void updateAccount(int index, double amount) {
    _accounts[index].balance += amount;
    notifyListeners();
  }
}
