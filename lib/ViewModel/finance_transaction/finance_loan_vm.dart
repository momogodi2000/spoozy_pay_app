// lib/viewmodels/loan_viewmodel.dart
import 'package:flutter/cupertino.dart';

import '../../models/finance_transaction/finance_loan.dart';

class LoanViewModel extends ChangeNotifier {
  List<LoanModel> _loans = [];
  bool _isLoading = false;

  List<LoanModel> get loans => _loans;
  bool get isLoading => _isLoading;

  Future<void> requestLoan(double amount, String lenderId) async {
    _isLoading = true;
    notifyListeners();

    // Simulated API call
    await Future.delayed(Duration(seconds: 2));

    _loans.add(
      LoanModel(
        id: DateTime.now().toString(),
        amount: amount,
        status: 'pending',
        requestDate: DateTime.now(),
        dueDate: DateTime.now().add(Duration(days: 30)),
        borrowerId: 'current_user_id',
        lenderId: lenderId,
      ),
    );

    _isLoading = false;
    notifyListeners();
  }
}
