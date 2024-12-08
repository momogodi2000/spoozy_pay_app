import 'package:flutter/material.dart';
import '../../models/transaction/transaction_view_models.dart';

class TransactionViewModel extends ChangeNotifier {
  List<Transaction_page> transactions = [];

  void addTransaction(Transaction_page transaction) {
    transactions.add(transaction);
    notifyListeners();
  }

  List<Transaction_page> get allTransactions => transactions;
}
