import 'package:flutter/material.dart';
import '../../models/transaction/loan_transaction.dart';

class LoanViewModel extends ChangeNotifier {
  List<Loan_page> loans = [];

  void addLoan(Loan_page loan) {
    loans.add(loan);
    notifyListeners();
  }

  List<Loan_page> get allLoans => loans;
}
