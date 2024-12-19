// lib/views/financial_transaction_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/finance_transaction/finance_transaction_vm.dart';
import 'financial_loan_page.dart';

class FinancialTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Financial Transactions'),
          elevation: 0,
        ),
        body: Consumer<TransactionViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPaymentMethodSelector(viewModel),
                    SizedBox(height: 24),
                    _buildTransactionForm(viewModel, context),
                    SizedBox(height: 24),
                    _buildTransactionHistory(viewModel),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FinancialLoanPage()),
            );
          },
          label: Text('Go to Loans'),
          icon: Icon(Icons.monetization_on),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelector(TransactionViewModel viewModel) {
    return Card(
      elevation: 4,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                _buildPaymentMethodChip(viewModel, 'Mobile Money', Icons.phone_android),
                _buildPaymentMethodChip(viewModel, 'Bank Transfer', Icons.account_balance),
                _buildPaymentMethodChip(viewModel, 'Blockchain', Icons.link),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodChip(
      TransactionViewModel viewModel,
      String method,
      IconData icon,
      ) {
    final isSelected = viewModel.selectedPaymentMethod == method;
    return FilterChip(
      selected: isSelected,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          SizedBox(width: 8),
          Text(method),
        ],
      ),
      onSelected: (selected) => viewModel.setPaymentMethod(method),
      backgroundColor: Colors.grey[200],
      selectedColor: Colors.blue[100],
    );
  }

  Widget _buildTransactionForm(TransactionViewModel viewModel, BuildContext context) {
    final amountController = TextEditingController();

    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Transaction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: viewModel.isLoading
                        ? null
                        : () async {
                      final amount = double.tryParse(amountController.text);
                      if (amount != null) {
                        await viewModel.makeDeposit(amount);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Deposit successful')),
                        );
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text('Deposit'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: viewModel.isLoading
                        ? null
                        : () {
                      // Implement withdrawal logic
                    },
                    icon: Icon(Icons.remove),
                    label: Text('Withdraw'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionHistory(TransactionViewModel viewModel) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (viewModel.transactions.isEmpty)
              Center(
                child: Text('No transactions yet'),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = viewModel.transactions[index];
                  return ListTile(
                    leading: Icon(
                      transaction.type == 'deposit' ? Icons.add_circle : Icons.remove_circle,
                      color: transaction.type == 'deposit' ? Colors.green : Colors.red,
                    ),
                    title: Text('\$${transaction.amount}'),
                    subtitle: Text(transaction.paymentMethod),
                    trailing: Text(
                      transaction.date.toString().split(' ')[0],
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}