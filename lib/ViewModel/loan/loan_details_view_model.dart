// loan_details_view_model.dart
import 'package:flutter/foundation.dart';
import '../../models/loan/loan_details_model.dart';

class LoanDetailsViewModel extends ChangeNotifier {
  LoanDetails _loanDetails = LoanDetails(
    loanAmount: 25000.00,
    loanDate: 'Jan 16, 2023',
    amountLeft: 20532.00,
    totalPaid: 4468.00,
    monthlyPayment: 1117.00,
    loanPeriod: 24,
    rate: 12,
    finishDate: 'May 16, 2023',
  );

  LoanDetails get loanDetails => _loanDetails;

  Future<void> repayLoan() async {
    // Implement repayment logic here
    notifyListeners();
  }
}