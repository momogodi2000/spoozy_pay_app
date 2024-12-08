import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/transaction/transaction_view_models.dart';
import '../../widgets/transaction/transaction_card.dart';


class SpozyTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionViewModel = Provider.of<TransactionViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Financial Transactions"),
        backgroundColor: Colors.blueAccent,
      ),
      body: transactionViewModel.allTransactions.isEmpty
          ? Center(child: Text("No transactions available."))
          : ListView.builder(
        itemCount: transactionViewModel.allTransactions.length,
        itemBuilder: (context, index) {
          return TransactionCard(
            transaction: transactionViewModel.allTransactions[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add transaction logic
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
