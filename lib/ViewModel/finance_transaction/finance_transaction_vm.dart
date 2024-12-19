// lib/viewmodels/transaction_viewmodel.dart
import 'package:flutter/material.dart';

import '../../models/finance_transaction/finance_transaction.dart';

class TransactionViewModel extends ChangeNotifier {
  List<TransactionModel> _transactions = [];
  String _selectedPaymentMethod = 'Mobile Money';
  bool _isLoading = false;

  List<TransactionModel> get transactions => _transactions;
  String get selectedPaymentMethod => _selectedPaymentMethod;
  bool get isLoading => _isLoading;

  Future<void> makeDeposit(double amount) async {
    _isLoading = true;
    notifyListeners();

    // Simulated API call
    await Future.delayed(Duration(seconds: 2));

    _transactions.add(
      TransactionModel(
        id: DateTime.now().toString(),
        amount: amount,
        type: 'deposit',
        status: 'completed',
        date: DateTime.now(),
        paymentMethod: _selectedPaymentMethod,
      ),
    );

    _isLoading = false;
    notifyListeners();
  }

  void setPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }
}
