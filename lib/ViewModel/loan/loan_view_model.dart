// lib/viewmodels/loan_view_model.dart
import 'package:flutter/foundation.dart';

import '../../models/loan/loan_model.dart';

class LoanViewModel extends ChangeNotifier {
  Loan? _currentLoan;
  bool _isLoading = false;
  String _selectedCurrency = 'USD';

  Loan? get currentLoan => _currentLoan;
  bool get isLoading => _isLoading;
  String get selectedCurrency => _selectedCurrency;

  get allLoans => null;

  void setCurrency(String currency) {
    _selectedCurrency = currency;
    notifyListeners();
  }

  Future<void> calculateLoan(double amount, int period, double rate) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    final monthlyPayment = (amount + (amount * rate * period / 12)) / period;

    _currentLoan = Loan(
      amount: amount,
      currency: _selectedCurrency,
      rate: rate,
      period: period,
      startDate: DateTime.now(),
      monthlyPayment: monthlyPayment,
      totalPaid: 0,
      amountLeft: amount,
      status: 'Active',
    );

    _isLoading = false;
    notifyListeners();
  }
}
