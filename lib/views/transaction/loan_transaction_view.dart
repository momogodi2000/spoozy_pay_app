import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/loan/loan_view_model.dart';
import '../../widgets/transaction/loan_card.dart';


class SpozyBorrowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loanViewModel = Provider.of<LoanViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Management"),
        backgroundColor: Colors.greenAccent,
      ),
      body: loanViewModel.allLoans.isEmpty
          ? Center(child: Text("No loans available."))
          : ListView.builder(
        itemCount: loanViewModel.allLoans.length,
        itemBuilder: (context, index) {
          return LoanCard(loan: loanViewModel.allLoans[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add loan logic
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
